package com.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImageProcess {
	public void deleteImage(String path) throws Exception {

		File file = new File(path);
		file.delete();
	}

	public void insertImage(InputStream is, String path) throws IOException {
		byte b[] = new byte[is.available()];
		is.read(b);
		FileOutputStream fs = new FileOutputStream(path);
		fs.write(b);
		fs.flush();
		fs.close();
	}
}
