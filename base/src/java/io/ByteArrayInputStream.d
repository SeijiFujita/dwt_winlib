/* language convertion www.dsource.org/project/tioport */
module java.io.ByteArrayInputStream;

import java.io.InputStream;

public class ByteArrayInputStream : java.io.InputStream.InputStream {

	alias read = java.io.InputStream.InputStream.read;
	alias skip = java.io.InputStream.InputStream.skip;
	alias available = java.io.InputStream.InputStream.available;
	alias close = java.io.InputStream.InputStream.close;
	alias mark = java.io.InputStream.InputStream.mark;
	alias reset = java.io.InputStream.InputStream.reset;
	alias markSupported = java.io.InputStream.InputStream.markSupported;

	protected byte[] buf;
	protected int pos;
	protected int fld_mark = 0;
	//protected int count;
	public this(byte[] aBuf) {
		this.buf = aBuf;
	}

	public this(byte[] aBuf, int offset, int length_ESCAPE) {
		this.buf = aBuf[offset .. offset + length_ESCAPE];
	}

	override public int read() {
		synchronized {
			if (pos >= this.buf.length) {
				return -1;
			}
			int result = this.buf[pos];
			pos++;
			return result & 0xFF;
		}
	}

	override public ptrdiff_t read(byte[] b, ptrdiff_t off, ptrdiff_t len) {
		synchronized return super.read(b, off, len);
	}

	override public long skip(long n) {
		synchronized {
			pos += n;
			return 0L;
		}
	}

	override public ptrdiff_t available() {
		synchronized {
			if (pos >= this.buf.length) {
				return 0;
			}
			return cast(int)(this.buf.length - pos);
		}
	}

	override public bool markSupported() {
		return false;
	}

	override public synchronized void mark(int readAheadLimit) {
	}

	override public synchronized void reset() {
		pos = 0;
	}

	override public void close() {
	}

}
