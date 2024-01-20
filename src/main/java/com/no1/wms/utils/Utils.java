package com.no1.wms.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.no1.wms.category.CategoryDto;
import com.no1.wms.planin.PlanInDto;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

public class Utils {
    public static byte[] makeQr(String url) {
        // QR 정보
        int width = 200;
        int height = 200;
        BitMatrix encode = null;
        try {
            // QR Code - BitMatrix: qr code 정보 생성
            encode = new MultiFormatWriter()
                    .encode(url, BarcodeFormat.QR_CODE, width, height);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(encode == null)
            return null;

        // QR Code - Image 생성. : 1회성으로 생성해야 하기 때문에
        // stream으로 Generate(1회성이 아니면 File로 작성 가능.)
        try {
            //output Stream
            ByteArrayOutputStream out = new ByteArrayOutputStream();

            //Bitmatrix, file.format, outputStream
            MatrixToImageWriter.writeToStream(encode, "PNG", out);

            return out.toByteArray();

        } catch (Exception e) {
            System.err.println("QR Code OutputStream 도중 Excpetion 발생, " + e.getMessage());
        }

        return null;
    }

    public static void download(String fileName, byte[] data, String contentType, HttpServletResponse response ) {

        try {
            fileName = new String((fileName).getBytes("utf-8"), "iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType(contentType);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

        try(ServletOutputStream os = response.getOutputStream();) {
            os.write(data);
            response.flushBuffer();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void makePlanInExcel(List<PlanInDto> list, HttpServletResponse response){
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

        int rowNum = 0;
        XSSFCellStyle cellStyle = null;
        cellStyle = xssfWorkbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setFillBackgroundColor(IndexedColors.BLACK.getIndex());
        XSSFFont font = xssfWorkbook.createFont();
        font.setColor(IndexedColors.WHITE.getIndex());
        font.setBold(true);

        cellStyle.setFont(font);
        XSSFSheet sheet = xssfWorkbook.createSheet("자료");
        Row topRow = sheet.createRow(0);
        Cell cell = null;
        cell = topRow.createCell(0);
        cell.setCellValue("카테고리");
        cell.setCellStyle(cellStyle);
        cell = topRow.createCell(1);
        cell.setCellValue("제품명");
        cell.setCellStyle(cellStyle);
        cell = topRow.createCell(2);
        cell.setCellValue("수량");
        cell.setCellStyle(cellStyle);
        cell = topRow.createCell(3);
        cell.setCellValue("공급업체");
        cell.setCellStyle(cellStyle);
        cell = topRow.createCell(4);
        cell.setCellValue("날짜");
        cell.setCellStyle(cellStyle);

        cell = topRow.createCell(5);
        cell.setCellValue("QR");
        cell.setCellStyle(cellStyle);


        XSSFCreationHelper helper = xssfWorkbook.getCreationHelper();
        XSSFCellStyle dataCellStyle = xssfWorkbook.createCellStyle();
        dataCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        dataCellStyle.setDataFormat(helper.createDataFormat().getFormat("yy-MM-dd"));
        sheet.setColumnWidth(5,(short)6000);

        for( int i = 0 ; i < list.size(); ++i){

            XSSFDrawing drawing = sheet.createDrawingPatriarch();
            XSSFClientAnchor anchor = helper.createClientAnchor();
            PlanInDto dto = list.get(i);
            System.out.println(dto);
            Row row = sheet.createRow(i+1);
            int cellNum = 0;
            row.setHeight((short) 3000);

            row.createCell(cellNum++).setCellValue(dto.getCaName());
            setColumnSize(sheet, 0, dto.getCaName());
            row.createCell(cellNum++).setCellValue(dto.getProductDto().getName());
            setColumnSize(sheet, 1, dto.getProductDto().getName());
            row.createCell(cellNum++).setCellValue(dto.getQuantity());
            setColumnSize(sheet, 2, dto.getQuantity().toString());
            row.createCell(cellNum++).setCellValue(dto.getVendorDto().getName());
            setColumnSize(sheet, 3, dto.getVendorDto().getName());

            Cell dateCell = row.createCell(cellNum);
            dateCell.setCellValue(dto.getDate());
            dateCell.setCellStyle(dataCellStyle);

            anchor.setCol1(5);
            anchor.setRow1(i+1);
//            String url = "http://localhost:8080/qr/"+dto.getUrl();
            // qr 생성 데이터 변경
            String url = "https://wms.coon.myds.me/qr/"+dto.getUrl();
            int picIdx = xssfWorkbook.addPicture(Utils.makeQr(url), XSSFWorkbook.PICTURE_TYPE_PNG);
            XSSFPicture pic = drawing.createPicture(anchor,picIdx );
            pic.resize();

        }
        try(ByteArrayOutputStream baos = new ByteArrayOutputStream();){
            xssfWorkbook.write(baos);
            download("QR데이터.xlsx", baos.toByteArray(), ConstantValues.EXCEL_TYPE, response);
        }catch(Exception e){
            e.printStackTrace();
        }


    }

    static void setColumnSize(XSSFSheet sheet, int index, String value) {
        int defaultColumnWidth = 2048;
        int maxLength = 70;
        int characterWidth = 256;
        double lengthWeight = 1.14388;
        int len = Math.min(value.length(), maxLength);
        int adjust = (((int)(len * lengthWeight) )* characterWidth) + defaultColumnWidth;

        int columnWidth = sheet.getColumnWidth(index);
        if (columnWidth > adjust) return;

        try {
            sheet.setColumnWidth(index, adjust);
        } catch (Exception e) {
            // ignore
        }
    }
}
