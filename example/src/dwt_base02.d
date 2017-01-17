// Written in the D programming language.
//
// dwt_base.d
// 
// http://www.java2s.com/Code/Java/SWT-JFace-Eclipse/CatalogSWT-JFace-Eclipse.htm
// http://www.java2s.com/Code/JavaAPI/org.eclipse.swt.widgets/Catalogorg.eclipse.swt.widgets.htm
// http://www.java2s.com/Tutorial/Java/0280__SWT/Catalog0280__SWT.htm
// http://study-swt.info/
//
// 
import org.eclipse.swt.all;
import org.eclipse.swt.internal.win32.OS;
// import java.lang.all;


//import std.conv;
import std.string;

import debuglog;


class MainForm : WindowManager
{
	bool	btn_status;
	
	this() {
		createWindow("dwt base");
		
		btn_status = true;
		createComponents();
		
		run();
	}
	
	Composite createComposit(int col, int layout) {
		// container Composite
		Composite container = new Composite(shell, SWT.NONE);
		container.setLayoutData(new GridData(layout));
		container.setLayout(new GridLayout(col, false));
		return container;
	}
	
	void createComponents() {
		shell.setLayout(new GridLayout(1, false));
		shell.setLayoutData(new GridData(GridData.FILL_HORIZONTAL));
		
		// container Composite
		Composite container = createComposit(2, GridData.FILL_HORIZONTAL);

		Button AppendBtn = createButton(container, "Append");
		Button SendMessageBtn = createButton(container, "SendMessage");
		
		AppendBtn.addSelectionListener(
			dgSelectionListener(SelectionListener.SELECTION, &putsAppend)
		);
		SendMessageBtn.addSelectionListener(
			dgSelectionListener(SelectionListener.SELECTION, &putsSendMessage)
		);
		
		createText();
	}
	void putsAppend(SelectionEvent e) {
version(none) {
		import std.datetime;
		StopWatch sw = StopWatch(AutoStart.yes);
		foreach (i ; 0 .. 1000) {
			outText.append(format("%d:ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\n", i));
		}
		outText.append(format("#---- %s ms ----", sw.peek().msecs));
}
	}
	void putsSendMessage(SelectionEvent e) {
version(none) {
		import std.datetime;
		StopWatch sw = StopWatch(AutoStart.yes);
		int length = OS.GetWindowTextLength(outText.handle);
		OS.SendMessage(outText.handle, OS.EM_SETSEL, length, length);
		foreach (i ; 0 .. 1000) {
			string s = format("%d:ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\r\n", i);
			OS.SendMessage(outText.handle, OS.EM_REPLACESEL, 0, cast(void*)StrToTCHARz(s));
		}
		outText.append(format("#---- %s ms ----", sw.peek().msecs));
}
	}
	Text outText;
	void createText() {
		outText = new Text(shell, SWT.MULTI | SWT.BORDER | SWT.V_SCROLL | SWT.H_SCROLL);
		GridData layoutData = new GridData(GridData.FILL_BOTH);
		outText.setLayoutData(layoutData);
		Listener scrollBarListener = new class Listener {
			override void handleEvent(Event event) {
				Text t = cast(Text)event.widget;
				Rectangle r1 = t.getClientArea();
				Rectangle r2 = t.computeTrim(r1.x, r1.y, r1.width, r1.height);
				Point p = t.computeSize(SWT.DEFAULT,  SWT.DEFAULT,  true);
				t.getHorizontalBar().setVisible(r2.width <= p.x);
				t.getVerticalBar().setVisible(r2.height <= p.y);
				if (event.type == SWT.Modify) {
					t.getParent().layout(true);
					t.showSelection();
				}
			}
		};
		outText.addListener(SWT.Resize, scrollBarListener);
		outText.addListener(SWT.Modify, scrollBarListener);
	}

}
//-----------------------------------------------------------------------------
void main()
{
	try
	{
		dlog("# start");
		auto main = new MainForm();
	} catch(Exception e) {
		dlog("Exception: ", e.toString());
	}
}
//-----------------------------------------------------------------------------
class WindowManager
{
private:
	Display display;
	Shell   shell;
	Label   statusLine;

	void init() {
		if (display is null) {
			display = new Display();
			// display.systemFont = new Font(display, new FontData("Noto Sans Japanese", 20, SWT.BOLD));
			// display.systemFont = new Font(display, new FontData("Meiryo UI", 20, SWT.BOLD));
			// display.systemFont = new Font(display, new FontData("Arial", 20, SWT.BOLD));
		}
		shell = new Shell(display);
	}

public:
	this() {
		dlog("init()");
		init();
	}
	this(string title) {
		init();
		setWindow(title);
	}
	void createWindow(string title) {
		setWindow(title);
	}
	void setWindow(string title, uint width = 600, uint hight = 400) {
		// create window
		shell.setText(title);
		shell.setSize(width, hight);
	//	shell.setLayout(new GridLayout(1, false));
	}
	Display getDisplay() {
		return display;
	}
	Shell getShell() {
		return shell;
	}
	void run() {
		// shell.pack();
		shell.open();
		while(!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		display.dispose();
	}
	
//-----------------------------------------------------------------------------
	// SWT.COLOR_DARK_GRAY;
	Color getSystemColor(int id) {
		return display.getSystemColor(id);
	}
	Color getColor(int red, int green, int blue) {
		int rgb = (red & 0xFF) | ((green & 0xFF) << 8) | ((blue & 0xFF) << 16);
		return Color.win32_new(display, rgb);
	}
//-----------------------------------------------------------------------------
// widgets
//-----------------------------------------------------------------------------
	Button createButton(Composite c, string text = "", int style = 0, int width = 0) {
		if (text is null) {
			text = "OK";
		}
		if (style == 0) {
			style = SWT.PUSH;
		}
		if (width == 0) {
			width = 100;
		}
		Button b = new Button(c, style);
		b.setText(text);
		
		GridData d = new GridData();
		int w = b.computeSize(SWT.DEFAULT, SWT.DEFAULT).x;
		if (w < width) {
			d.widthHint = width;
		} else {
			d.widthHint = w;
		}
		b.setLayoutData(d);
    	return b;
	}
	
	Label createLabel(Composite c, string text, int style = SWT.NONE) {
		Label l = new Label(c, style);
		l.setText(text);
		return l;
	}
	
	void setStatusLine() {
		statusLine = new Label(shell,  SWT.BORDER /+ SWT.NONE +/);
		statusLine.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
	}
	
	void createHorizotalLine(Composite c)
    {
        Label line = new Label(c, SWT.SEPARATOR | SWT.HORIZONTAL);
        GridData data = new GridData(GridData.HORIZONTAL_ALIGN_FILL);
        line.setLayoutData(data);
    }
	
    Composite createRightAlignmentComposite()
    {
		enum int BUTTON_WIDTH = 70;
		enum int HORIZONTAL_SPACING = 3;
		enum int MARGIN_WIDTH = 0;
		enum int MARGIN_HEIGHT = 2;
        
        Composite c = new Composite(shell, SWT.NONE);
        GridLayout layout = new GridLayout(2, false);
        layout.horizontalSpacing = HORIZONTAL_SPACING;
        layout.marginWidth = MARGIN_WIDTH;
        layout.marginHeight = MARGIN_HEIGHT;
        c.setLayout(layout);
        GridData data = new GridData(GridData.HORIZONTAL_ALIGN_END);
        c.setLayoutData(data);
        return c;
    }
//-----------------------------------------------------------------------------
// Menu
//-----------------------------------------------------------------------------
	void setMenu() {
		// create menubar
		Menu bar = new Menu(shell, SWT.BAR);
		shell.setMenuBar(bar);
		// add files menu
		Menu fileMenu = addTopMenu(bar, "ファイル(&F)"); 
		addSubMenu(fileMenu, "新規(&N)\tCtrl+N", &fileOpen, SWT.CTRL + 'N');
		addSubMenu(fileMenu, "開く(&O)...\tCtrl+O", &dg_dummy, SWT.CTRL + 'O');
		addSubMenu(fileMenu, "上書き保存(&S)\tCtrl+S", &dg_dummy, SWT.CTRL + 'S');
		addSubMenu(fileMenu, "名前を付けて保存(&A)...", &dg_dummy);
		addMenuSeparator(fileMenu);
		addSubMenu(fileMenu, "終了(&X)", &dg_exit);
		// add ...
		Menu setupMenu = addTopMenu(bar, "設定(&S)"); 
		addSubMenu(setupMenu, "FontDialog", &selectFont);
		addSubMenu(setupMenu, "ColorDialog", &selectColor);
		addMenuSeparator(setupMenu);
		addSubMenu(setupMenu, "About", &dg_dummy);
	}
	Menu addTopMenu(Menu bar, string text) {
		// menu top
		MenuItem menuItem = new MenuItem(bar, SWT.CASCADE);
		menuItem.setText(text);
		// menu 
		Menu menu = new Menu(bar);
		menuItem.setMenu(menu);
		return menu;
	}
/**	
	struct SubMenuData {
		string name;
		void delegate() dg;
		int accelerator;
		
		addSubMenu(string m, void delegate() d, int acc);
		
	}
	struct MenuData {
		string name;
		SubMenuData[] submenu;
	}
*/	
	void addSubMenu(Menu menu, string text, void delegate() dg, int accelerator = 0) {
		MenuItem item = new MenuItem(menu, SWT.PUSH);
		item.setText(text);
		if (accelerator != 0) {
			item.setAccelerator(accelerator); // SWT.CTRL + 'A'
		}
		item.addSelectionListener(new class SelectionAdapter {
                override void widgetSelected(SelectionEvent event) {
                    dg();
				}
			}
		);
		
/**		item.addArmListener(new class ArmListener {
				void widgetArmed(ArmEvent event) {
				//	statusLine.setText((cast(MenuItem)event.getSource()).getText());
				}
			}
		);
*/	}
    void addMenuSeparator(Menu menu) {
		new MenuItem(menu, SWT.SEPARATOR);
	}
//----------------------
    void dg_dummy() {
	}
	void dg_exit() {
		shell.close();
	}
	void fileOpen() {
		FileDialog dialog = new FileDialog(shell, SWT.OPEN);
		dialog.setFilterExtensions(["*.d", "*.java", "*.*"]);
		string fname = dialog.open();
		if (fname.length != 0) {
		}
    	
    }
	void selectFont() {
		FontDialog fontDialog = new FontDialog(shell);
		// set current Font to FontDialog
		fontDialog.setFontList(shell.getFont().getFontData());
		FontData fontData = fontDialog.open();
//		if (fontData !is null){
//			if (shell.font !is null)
//				shell.font.dispose();
//			Font font = new Font(display, fontData);
//			shell.setFont(font);
//		}
	}
/*
private static Font loadMonospacedFont(Display display) {
	String jreHome = System.getProperty("java.home");
	File file = new File(jreHome, "/lib/fonts/LucidaTypewriterRegular.ttf");
	if (!file.exists()) {
		throw new IllegalStateException(file.toString());
	}
	if (!display.loadFont(file.toString())) {
		throw new IllegalStateException(file.toString());
	}
	final Font font = new Font(display, "Lucida Sans Typewriter", 10, SWT.NORMAL);
	display.addListener(SWT.Dispose, new Listener() {
		public void handleEvent(Event event) {
			font.dispose();
		}
	});
	return font;
}
*/
	void  selectColor() {
		ColorDialog colorDialog = new ColorDialog(shell);
		colorDialog.open();
//		colorDialog.setRGB(text.getForeground().getRGB());
//		RGB rgb = colorDialog.open();
//
//		if (rgb !is null) {
//			if (foregroundColor !is null) {
//				foregroundColor.dispose();
//			}
//			foregroundColor = new Color(display, rgb);
//			text.setForeground(foregroundColor);
//		}
	}
	
	string selectDirecoty(string setpath) {
		DirectoryDialog ddlg = new DirectoryDialog(shell);
		ddlg.setFilterPath(setpath);
		ddlg.setText("DirectoryDialog");
		ddlg.setMessage("Select a directory");
		return ddlg.open();
	}
}

