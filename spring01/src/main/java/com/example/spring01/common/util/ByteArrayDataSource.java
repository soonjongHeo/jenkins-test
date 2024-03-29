package com.example.spring01.common.util;

import java.io.*;

import javax.activation.DataSource;

public class ByteArrayDataSource implements DataSource{
	 
    byte[] bytes;
      String contentType;
      String name;

      public ByteArrayDataSource(byte[] bytes, String contentType, String name) {
         this.bytes = bytes;
         if(contentType == null)
            this.contentType = "application/octet-stream";
         else
            this.contentType = contentType;
         this.name = name;
      }

      @Override
      public String getContentType() {
         return contentType;
      }
      
      @Override
      public InputStream getInputStream() {
         // 가장 마지막의 CR/LF를 없앤다.
         return new ByteArrayInputStream(bytes,0,bytes.length - 2);
      }
      
      @Override
      public String getName() {
         return name;
      }
      
      @Override
      public OutputStream getOutputStream() throws IOException {
         throw new FileNotFoundException();
      }
}

