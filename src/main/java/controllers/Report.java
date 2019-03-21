package controllers;

import fileUtils.FileUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class Report {

  public Report() {}

  public static String getApiReport(InputStream responseStream, String filename)
      throws IOException {
    File pdfApi = FileUtil.getApiReport(responseStream, filename);
    return FileUtil.readFile(pdfApi);
  }

  public static String getDesktopReport(String filename) throws IOException {
    File pdfDesktop = FileUtil.getDesktopReport(filename);
    return FileUtil.readFile(pdfDesktop);
  }
}
