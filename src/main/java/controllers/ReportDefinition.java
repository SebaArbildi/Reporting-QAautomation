package controllers;

import fileUtils.FileUtil;

import java.util.Collections;
import java.util.List;

public class ReportDefinition {

  public ReportDefinition() {}

  public static List<String> getRwzFilesFromDesktop() {
    List<String> rwzFiles = FileUtil.getDesktopReports();
    Collections.sort(rwzFiles);
    return rwzFiles;
  }
}
