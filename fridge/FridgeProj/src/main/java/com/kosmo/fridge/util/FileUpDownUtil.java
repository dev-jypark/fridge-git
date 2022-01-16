package com.kosmo.fridge.util;

import java.io.File;

public class FileUpDownUtil {
	// [파일 이름 중복 체크용 메소드]
		public static String getNewFileName(String path, String fileName) {
			// fileName=원격.txt
			File file = new File(path + File.separator + fileName);
			if (!file.exists()) {
				return fileName;
			} else {
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1).trim();
				String fileNameExcludeExt = fileName.substring(0, fileName.lastIndexOf("."));

				String newFileName;
				while (true) {
					newFileName = "";
					if (fileNameExcludeExt.indexOf("_") != -1) {// 파일명에 _가 포함됨
						String[] arrFiles = fileNameExcludeExt.split("_");
						String lastName = arrFiles[arrFiles.length - 1];
						try {
							int index = Integer.parseInt(lastName);
							for (int i = 0; i < arrFiles.length; i++) {
								if (i != arrFiles.length - 1)
									newFileName += arrFiles[i] + "_";
								else
									newFileName += String.valueOf(index + 1);
							}
							newFileName += "." + ext;
						} catch (Exception e) {
							newFileName += fileNameExcludeExt + "_1." + ext;
						}
					} else {// _가 없음
						newFileName += fileNameExcludeExt + "_1." + ext;
					}
					File f = new File(path + File.separator + newFileName);
					if (f.exists()) {
						fileNameExcludeExt = newFileName.substring(0, newFileName.lastIndexOf("."));
						continue;
					} else
						break;
				} //////////// while

				return newFileName;
			}
		}/////////////////////
}
