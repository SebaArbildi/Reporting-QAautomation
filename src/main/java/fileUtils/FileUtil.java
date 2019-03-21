package fileUtils;

import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.List;

public class FileUtil {
  private static final String DESKTOP_RWZ_FILES_PATH = "Ascentis/Automation/rwzFiles/";
  private static final String DESKTOP_PDF_FILES_PATH = "Ascentis/Automation/desktopPdf/";
  private static final String SERVER_ADDRESS = System.getProperty("SERVER_ADDRESS");
  private static final String LOCAL_STORE_PATH = "reports/";
  private static final int QUANTITY_OF_CHARACTERS_TO_REMOVE = 24;

  public static String readFile(File pdf) throws IOException {
    String pdfContent = pdfToString(pdf);
    pdfContent = removeExtraData(pdfContent);
    char pdfContentArray[] = pdfContent.toCharArray();
    Arrays.sort(pdfContentArray);
    return new String(pdfContentArray);
  }

  public static File getApiReport(InputStream initialStream, String filename) throws IOException {
    String path = String.format("%1$s%2$s.pdf",LOCAL_STORE_PATH, filename);
    File targetFile = new File(path);
    FileUtils.copyInputStreamToFile(initialStream, targetFile);
    return targetFile;
  }

  public static File getDesktopReport(String filename) {
    String filenamePdf = String.format("%1$s.pdf", filename);
    return getFileFromServer(SERVER_ADDRESS, DESKTOP_PDF_FILES_PATH, filenamePdf);
  }

  public static List<String> getDesktopReports() {
    return getFolderFromServer(SERVER_ADDRESS, DESKTOP_RWZ_FILES_PATH);
  }

  private static String removeExtraData(String pdfContent) {
    boolean hasPageIndex = true;
    while (hasPageIndex) {
      int pageIndex = pdfContent.indexOf("Page");
      if (pageIndex > -1) {
        pdfContent =
            pdfContent.substring(0, pageIndex)
                + pdfContent.substring(
                    pageIndex + QUANTITY_OF_CHARACTERS_TO_REMOVE, pdfContent.length());
      } else {
        hasPageIndex = false;
      }
    }
    return pdfContent;
  }

  private static String pdfToString(File pdf) {
    String pdfFileInText = "";
    try (PDDocument document = PDDocument.load(pdf)) {
      document.getClass();
      if (!document.isEncrypted()) {
        PDFTextStripper tStripper = new PDFTextStripper();
        pdfFileInText = tStripper.getText(document);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return pdfFileInText;
  }

  private static File getFileFromServer(String serverAddress, String path, String fileName) {
    File file = null;
    try {
      String url = String.format("smb://%1$s%2$s%3$s",serverAddress, path, fileName);
      NtlmPasswordAuthentication auth =
          new NtlmPasswordAuthentication(null, "devacct", "Packet12345!");
      SmbFile smbFile = new SmbFile(url, auth);
      file = new File(LOCAL_STORE_PATH + fileName);
      try (InputStream in = smbFile.getInputStream();
          FileOutputStream out = new FileOutputStream(file)) {
        IOUtils.copy(in, out);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return file;
  }

  private static List<String> getFolderFromServer(String serverAddress, String path) {
    List<String> folderElements = null;
    try {
      String url = String.format("smb://%1$s%2$s",serverAddress, path);
      NtlmPasswordAuthentication auth =
          new NtlmPasswordAuthentication(null, "devacct", "Packet12345!");
      SmbFile smbFile = new SmbFile(url, auth);
      folderElements = Arrays.asList(smbFile.list());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return folderElements;
  }
}
