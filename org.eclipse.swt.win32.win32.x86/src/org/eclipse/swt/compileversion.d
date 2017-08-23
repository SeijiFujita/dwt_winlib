/*
*/


module org.eclipse.swt.compileversion;

import std.conv;

public string buildVersion()
{
	enum string ver = __VENDOR__ ~ " " ~ to!string(__VERSION__) ~ ", LibBuildDATE:" ~ __TIMESTAMP__;
	return ver;
}
