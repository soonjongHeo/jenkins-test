package com.example.spring01.service;

import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.spring01.model.dto.CartDTO;
import com.example.spring01.service.CartService;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class PdfServiceImpl implements PdfService {
	@Inject
	CartService cartService;
	@Override
	public String createPdf() {
		String result="";
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
 
		HttpSession session = request.getSession(); //세션선언
		try {
			String userId = (String) session.getAttribute("userid");
			System.out.println("userId: " + userId);
			if(userId != null) {
				//pdf 문서 객체
				Document document=new Document();
				//pdf 생성 객체
				PdfWriter writer=PdfWriter.getInstance(
	document, new FileOutputStream("d:/sample.pdf"));
				document.open();
				//한글이 지원되는 폰트 지정
				BaseFont baseFont=BaseFont.createFont(
	"c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H
	,BaseFont.EMBEDDED);
				//폰트 사이즈 지정
				Font font=new Font(baseFont, 12);
				//4컬럼 테이블 
				PdfPTable table=new PdfPTable(4);
				//문단, 텍스트 내용
				Chunk chunk=new Chunk("장바구니",font);
				Paragraph ph=new Paragraph(chunk);
				ph.setAlignment(Element.ALIGN_CENTER); //가운데 정렬
				document.add(ph);
				document.add(Chunk.NEWLINE); //줄바꿈
				document.add(Chunk.NEWLINE);
				//document.add(Chunk.NEXTPAGE); //다음 페이지로
				//셀 생성( <td> )
				PdfPCell cell1=new PdfPCell(new Phrase("상품명",font));
				PdfPCell cell2=new PdfPCell(new Phrase("단가",font));
				PdfPCell cell3=new PdfPCell(new Phrase("수량",font));
				PdfPCell cell4=new PdfPCell(new Phrase("금액",font));
				//가운데 정렬
				cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
				
				//테이블에 셀 추가
				table.addCell(cell1);
				table.addCell(cell2);
				table.addCell(cell3);
				table.addCell(cell4);
				//장바구니 목록 리턴
				List<CartDTO> items=cartService.listCart(userId);
				for(int i=0; i<items.size(); i++) {
					CartDTO dto=items.get(i); //i번째 레코드를 dto에 저장
					PdfPCell cellProductName=new PdfPCell(
							new Phrase(dto.getProductName(), font));
					cellProductName.setHorizontalAlignment(
							Element.ALIGN_CENTER);
					table.addCell(cellProductName);//테이블에 셀 추가
	
	//				PdfPCell cellPrice=new PdfPCell(
	//						new Phrase(dto.getPrice()+"", font));
					PdfPCell cellPrice=new PdfPCell(
							new Phrase(Integer.toString(dto.getPrice())
									, font));
					cellPrice.setHorizontalAlignment(
							Element.ALIGN_RIGHT);
					
					table.addCell(cellPrice);
	
					PdfPCell cellAmount=new PdfPCell(
							new Phrase(dto.getAmount()+"", font));
					cellAmount.setHorizontalAlignment(
							Element.ALIGN_RIGHT);
					table.addCell(cellAmount);
	
					PdfPCell cellMoney=new PdfPCell(
							new Phrase(dto.getMoney()+"", font));
					cellMoney.setHorizontalAlignment(
							Element.ALIGN_RIGHT);
					table.addCell(cellMoney);
				}
				
				
				//document에 테이블 추가
				document.add(table);
				//pdf 파일이 생성됨
				document.close();
				
				result="pdf 파일이 생성되었습니다.";
			}else {
				result="로그인이 필요합니다.";
			}
		} catch (Exception e) {
			result="pdf 파일 생성 실패...";
			e.printStackTrace();
		}
		return result;
	}

}




