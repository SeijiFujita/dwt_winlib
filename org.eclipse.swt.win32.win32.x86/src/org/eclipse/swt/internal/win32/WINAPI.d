/**
 * This module declared window APIs required by SWT but not in std.c.windows.windows,
 * The one in the std.c.windows.windows module are aliased
 */

module org.eclipse.swt.internal.win32.WINAPI;

public import org.eclipse.swt.internal.win32.WINTYPES;
import java.nonstandard.SafeUtf;

version (Tango) {
	import tango.sys.win32.Types;
	import tango.stdc.stdint;

	static import tango.sys.win32.UserGdi;

	public alias STDWINAPI = tango.sys.win32.UserGdi;

	alias GetWindowInfo = STDWINAPI.GetWindowInfo;
	alias EnumDisplayMonitors = STDWINAPI.EnumDisplayMonitors;
	alias GetMonitorInfoA = STDWINAPI.GetMonitorInfoA;
	alias GetBinaryTypeA = STDWINAPI.GetBinaryTypeA;
	alias GetShortPathNameA = STDWINAPI.GetShortPathNameA;
	alias GetEnvironmentStringsA = STDWINAPI.GetEnvironmentStringsA;
	alias FreeEnvironmentStringsA = STDWINAPI.FreeEnvironmentStringsA;
	alias FormatMessageA = STDWINAPI.FormatMessageA;
	alias CreateMailslotA = STDWINAPI.CreateMailslotA;
	alias lstrcmpA = STDWINAPI.lstrcmpA;
	alias lstrcmpiA = STDWINAPI.lstrcmpiA;
	alias lstrcpynA = STDWINAPI.lstrcpynA;
	alias lstrcpyA = STDWINAPI.lstrcpyA;
	alias lstrcatA = STDWINAPI.lstrcatA;
	alias lstrlenA = STDWINAPI.lstrlenA;
	alias CreateMutexA = STDWINAPI.CreateMutexA;
	alias OpenMutexA = STDWINAPI.OpenMutexA;
	alias CreateEventA = STDWINAPI.CreateEventA;
	alias OpenEventA = STDWINAPI.OpenEventA;
	alias CreateSemaphoreA = STDWINAPI.CreateSemaphoreA;
	alias OpenSemaphoreA = STDWINAPI.OpenSemaphoreA;
	alias CreateFileMappingA = STDWINAPI.CreateFileMappingA;
	alias OpenFileMappingA = STDWINAPI.OpenFileMappingA;
	alias GetLogicalDriveStringsA = STDWINAPI.GetLogicalDriveStringsA;
	alias LoadLibraryA = STDWINAPI.LoadLibraryA;
	alias LoadLibraryExA = STDWINAPI.LoadLibraryExA;
	alias GetModuleFileNameA = STDWINAPI.GetModuleFileNameA;
	alias GetModuleHandleA = STDWINAPI.GetModuleHandleA;
	alias FatalAppExitA = STDWINAPI.FatalAppExitA;
	alias GetCommandLineA = STDWINAPI.GetCommandLineA;
	alias GetEnvironmentVariableA = STDWINAPI.GetEnvironmentVariableA;
	alias SetEnvironmentVariableA = STDWINAPI.SetEnvironmentVariableA;
	alias ExpandEnvironmentStringsA = STDWINAPI.ExpandEnvironmentStringsA;
	alias OutputDebugStringA = STDWINAPI.OutputDebugStringA;
	alias FindResourceA = STDWINAPI.FindResourceA;
	alias FindResourceExA = STDWINAPI.FindResourceExA;
	alias EnumResourceTypesA = STDWINAPI.EnumResourceTypesA;
	alias EnumResourceNamesA = STDWINAPI.EnumResourceNamesA;
	alias EnumResourceLanguagesA = STDWINAPI.EnumResourceLanguagesA;
	alias BeginUpdateResourceA = STDWINAPI.BeginUpdateResourceA;
	alias UpdateResourceA = STDWINAPI.UpdateResourceA;
	alias EndUpdateResourceA = STDWINAPI.EndUpdateResourceA;
	alias GlobalAddAtomA = STDWINAPI.GlobalAddAtomA;
	alias GlobalFindAtomA = STDWINAPI.GlobalFindAtomA;
	alias GlobalGetAtomNameA = STDWINAPI.GlobalGetAtomNameA;
	alias AddAtomA = STDWINAPI.AddAtomA;
	alias FindAtomA = STDWINAPI.FindAtomA;
	alias GetAtomNameA = STDWINAPI.GetAtomNameA;
	alias GetProfileIntA = STDWINAPI.GetProfileIntA;
	alias GetProfileStringA = STDWINAPI.GetProfileStringA;
	alias WriteProfileStringA = STDWINAPI.WriteProfileStringA;
	alias GetProfileSectionA = STDWINAPI.GetProfileSectionA;
	alias WriteProfileSectionA = STDWINAPI.WriteProfileSectionA;
	alias GetPrivateProfileIntA = STDWINAPI.GetPrivateProfileIntA;
	alias GetPrivateProfileStringA = STDWINAPI.GetPrivateProfileStringA;
	alias WritePrivateProfileStringA = STDWINAPI.WritePrivateProfileStringA;
	alias GetPrivateProfileSectionA = STDWINAPI.GetPrivateProfileSectionA;
	alias WritePrivateProfileSectionA = STDWINAPI.WritePrivateProfileSectionA;
	alias GetDriveTypeA = STDWINAPI.GetDriveTypeA;
	alias GetSystemDirectoryA = STDWINAPI.GetSystemDirectoryA;
	alias GetTempPathA = STDWINAPI.GetTempPathA;
	alias GetTempFileNameA = STDWINAPI.GetTempFileNameA;
	alias GetWindowsDirectoryA = STDWINAPI.GetWindowsDirectoryA;
	alias SetCurrentDirectoryA = STDWINAPI.SetCurrentDirectoryA;
	alias GetCurrentDirectoryA = STDWINAPI.GetCurrentDirectoryA;
	alias GetDiskFreeSpaceA = STDWINAPI.GetDiskFreeSpaceA;
	alias CreateDirectoryA = STDWINAPI.CreateDirectoryA;
	alias CreateDirectoryExA = STDWINAPI.CreateDirectoryExA;
	alias RemoveDirectoryA = STDWINAPI.RemoveDirectoryA;
	alias GetFullPathNameA = STDWINAPI.GetFullPathNameA;
	alias DefineDosDeviceA = STDWINAPI.DefineDosDeviceA;
	alias QueryDosDeviceA = STDWINAPI.QueryDosDeviceA;
	alias CreateFileA = STDWINAPI.CreateFileA;
	alias SetFileAttributesA = STDWINAPI.SetFileAttributesA;
	alias GetFileAttributesA = STDWINAPI.GetFileAttributesA;
	alias GetFileAttributesExA = STDWINAPI.GetFileAttributesExA;
	alias GetCompressedFileSizeA = STDWINAPI.GetCompressedFileSizeA;
	alias DeleteFileA = STDWINAPI.DeleteFileA;
	alias SearchPathA = STDWINAPI.SearchPathA;
	alias CopyFileA = STDWINAPI.CopyFileA;
	alias MoveFileA = STDWINAPI.MoveFileA;
	alias MoveFileExA = STDWINAPI.MoveFileExA;
	alias CreateNamedPipeA = STDWINAPI.CreateNamedPipeA;
	alias GetNamedPipeHandleStateA = STDWINAPI.GetNamedPipeHandleStateA;
	alias CallNamedPipeA = STDWINAPI.CallNamedPipeA;
	alias WaitNamedPipeA = STDWINAPI.WaitNamedPipeA;
	alias SetVolumeLabelA = STDWINAPI.SetVolumeLabelA;
	alias GetVolumeInformationA = STDWINAPI.GetVolumeInformationA;
	alias ClearEventLogA = STDWINAPI.ClearEventLogA;
	alias BackupEventLogA = STDWINAPI.BackupEventLogA;
	alias OpenEventLogA = STDWINAPI.OpenEventLogA;
	alias RegisterEventSourceA = STDWINAPI.RegisterEventSourceA;
	alias OpenBackupEventLogA = STDWINAPI.OpenBackupEventLogA;
	alias ReadEventLogA = STDWINAPI.ReadEventLogA;
	alias ReportEventA = STDWINAPI.ReportEventA;
	alias AccessCheckAndAuditAlarmA = STDWINAPI.AccessCheckAndAuditAlarmA;
	alias ObjectOpenAuditAlarmA = STDWINAPI.ObjectOpenAuditAlarmA;
	alias ObjectPrivilegeAuditAlarmA = STDWINAPI.ObjectPrivilegeAuditAlarmA;
	alias ObjectCloseAuditAlarmA = STDWINAPI.ObjectCloseAuditAlarmA;
	alias PrivilegedServiceAuditAlarmA = STDWINAPI.PrivilegedServiceAuditAlarmA;
	alias SetFileSecurityA = STDWINAPI.SetFileSecurityA;
	alias GetFileSecurityA = STDWINAPI.GetFileSecurityA;
	alias FindFirstChangeNotificationA = STDWINAPI.FindFirstChangeNotificationA;
	alias IsBadStringPtrA = STDWINAPI.IsBadStringPtrA;
	alias LookupAccountSidA = STDWINAPI.LookupAccountSidA;
	alias LookupAccountNameA = STDWINAPI.LookupAccountNameA;
	alias LookupPrivilegeValueA = STDWINAPI.LookupPrivilegeValueA;
	alias LookupPrivilegeNameA = STDWINAPI.LookupPrivilegeNameA;
	alias LookupPrivilegeDisplayNameA = STDWINAPI.LookupPrivilegeDisplayNameA;
	alias BuildCommDCBA = STDWINAPI.BuildCommDCBA;
	alias BuildCommDCBAndTimeoutsA = STDWINAPI.BuildCommDCBAndTimeoutsA;
	alias CommConfigDialogA = STDWINAPI.CommConfigDialogA;
	alias GetDefaultCommConfigA = STDWINAPI.GetDefaultCommConfigA;
	alias SetDefaultCommConfigA = STDWINAPI.SetDefaultCommConfigA;
	alias GetComputerNameA = STDWINAPI.GetComputerNameA;
	alias SetComputerNameA = STDWINAPI.SetComputerNameA;
	alias GetUserNameA = STDWINAPI.GetUserNameA;
	alias wvsprintfA = STDWINAPI.wvsprintfA;
	alias LoadKeyboardLayoutA = STDWINAPI.LoadKeyboardLayoutA;
	alias GetKeyboardLayoutNameA = STDWINAPI.GetKeyboardLayoutNameA;
	alias CreateDesktopA = STDWINAPI.CreateDesktopA;
	alias OpenDesktopA = STDWINAPI.OpenDesktopA;
	alias EnumDesktopsA = STDWINAPI.EnumDesktopsA;
	alias CreateWindowStationA = STDWINAPI.CreateWindowStationA;
	alias OpenWindowStationA = STDWINAPI.OpenWindowStationA;
	alias EnumWindowStationsA = STDWINAPI.EnumWindowStationsA;
	alias GetUserObjectInformationA = STDWINAPI.GetUserObjectInformationA;
	alias SetUserObjectInformationA = STDWINAPI.SetUserObjectInformationA;
	alias RegisterWindowMessageA = STDWINAPI.RegisterWindowMessageA;
	alias GetMessageA = STDWINAPI.GetMessageA;
	alias DispatchMessageA = STDWINAPI.DispatchMessageA;
	alias PeekMessageA = STDWINAPI.PeekMessageA;
	alias SendMessageA = STDWINAPI.SendMessageA;
	alias SendMessageA = STDWINAPI.SendMessageA;
	alias SendMessageA = STDWINAPI.SendMessageA;
	alias SendMessageA = STDWINAPI.SendMessageA;
	alias SendMessageTimeoutA = STDWINAPI.SendMessageTimeoutA;
	alias SendNotifyMessageA = STDWINAPI.SendNotifyMessageA;
	alias SendMessageCallbackA = STDWINAPI.SendMessageCallbackA;
	alias PostMessageA = STDWINAPI.PostMessageA;
	alias PostThreadMessageA = STDWINAPI.PostThreadMessageA;
	alias DefWindowProcA = STDWINAPI.DefWindowProcA;
	alias CallWindowProcA = STDWINAPI.CallWindowProcA;
	alias RegisterClassA = STDWINAPI.RegisterClassA;
	alias UnregisterClassA = STDWINAPI.UnregisterClassA;
	alias GetClassInfoA = STDWINAPI.GetClassInfoA;
	alias RegisterClassExA = STDWINAPI.RegisterClassExA;
	alias GetClassInfoExA = STDWINAPI.GetClassInfoExA;
	alias CreateWindowExA = STDWINAPI.CreateWindowExA;
	alias CreateDialogParamA = STDWINAPI.CreateDialogParamA;
	alias CreateDialogIndirectParamA = STDWINAPI.CreateDialogIndirectParamA;
	alias DialogBoxParamA = STDWINAPI.DialogBoxParamA;
	alias DialogBoxIndirectParamA = STDWINAPI.DialogBoxIndirectParamA;
	alias SetDlgItemTextA = STDWINAPI.SetDlgItemTextA;
	alias GetDlgItemTextA = STDWINAPI.GetDlgItemTextA;
	alias SendDlgItemMessageA = STDWINAPI.SendDlgItemMessageA;
	alias DefDlgProcA = STDWINAPI.DefDlgProcA;
	alias CallMsgFilterA = STDWINAPI.CallMsgFilterA;
	alias RegisterClipboardFormatA = STDWINAPI.RegisterClipboardFormatA;
	alias GetClipboardFormatNameA = STDWINAPI.GetClipboardFormatNameA;
	alias CharToOemA = STDWINAPI.CharToOemA;
	alias OemToCharA = STDWINAPI.OemToCharA;
	alias CharToOemBuffA = STDWINAPI.CharToOemBuffA;
	alias OemToCharBuffA = STDWINAPI.OemToCharBuffA;
	alias CharUpperA = STDWINAPI.CharUpperA;
	alias CharUpperBuffA = STDWINAPI.CharUpperBuffA;
	alias CharLowerA = STDWINAPI.CharLowerA;
	alias CharLowerBuffA = STDWINAPI.CharLowerBuffA;
	alias CharNextA = STDWINAPI.CharNextA;
	alias CharPrevA = STDWINAPI.CharPrevA;
	alias IsCharAlphaA = STDWINAPI.IsCharAlphaA;
	alias IsCharAlphaNumericA = STDWINAPI.IsCharAlphaNumericA;
	alias IsCharUpperA = STDWINAPI.IsCharUpperA;
	alias IsCharLowerA = STDWINAPI.IsCharLowerA;
	alias GetKeyNameTextA = STDWINAPI.GetKeyNameTextA;
	alias VkKeyScanA = STDWINAPI.VkKeyScanA;
	alias VkKeyScanExA = STDWINAPI.VkKeyScanExA;
	alias MapVirtualKeyA = STDWINAPI.MapVirtualKeyA;
	alias MapVirtualKeyExA = STDWINAPI.MapVirtualKeyExA;
	alias LoadAcceleratorsA = STDWINAPI.LoadAcceleratorsA;
	alias CreateAcceleratorTableA = STDWINAPI.CreateAcceleratorTableA;
	alias CopyAcceleratorTableA = STDWINAPI.CopyAcceleratorTableA;
	alias TranslateAcceleratorA = STDWINAPI.TranslateAcceleratorA;
	alias LoadMenuA = STDWINAPI.LoadMenuA;
	alias LoadMenuIndirectA = STDWINAPI.LoadMenuIndirectA;
	alias ChangeMenuA = STDWINAPI.ChangeMenuA;
	alias GetMenuStringA = STDWINAPI.GetMenuStringA;
	alias InsertMenuA = STDWINAPI.InsertMenuA;
	alias AppendMenuA = STDWINAPI.AppendMenuA;
	alias ModifyMenuA = STDWINAPI.ModifyMenuA;
	alias InsertMenuItemA = STDWINAPI.InsertMenuItemA;
	alias GetMenuItemInfoA = STDWINAPI.GetMenuItemInfoA;
	alias SetMenuItemInfoA = STDWINAPI.SetMenuItemInfoA;
	alias DrawTextA = STDWINAPI.DrawTextA;
	alias DrawTextExA = STDWINAPI.DrawTextExA;
	alias GrayStringA = STDWINAPI.GrayStringA;
	alias DrawStateA = STDWINAPI.DrawStateA;
	alias TabbedTextOutA = STDWINAPI.TabbedTextOutA;
	alias GetTabbedTextExtentA = STDWINAPI.GetTabbedTextExtentA;
	alias SetPropA = STDWINAPI.SetPropA;
	alias GetPropA = STDWINAPI.GetPropA;
	alias RemovePropA = STDWINAPI.RemovePropA;
	alias EnumPropsExA = STDWINAPI.EnumPropsExA;
	alias EnumPropsA = STDWINAPI.EnumPropsA;
	alias SetWindowTextA = STDWINAPI.SetWindowTextA;
	alias GetWindowTextA = STDWINAPI.GetWindowTextA;
	alias GetWindowTextLengthA = STDWINAPI.GetWindowTextLengthA;
	alias MessageBoxA = STDWINAPI.MessageBoxA;
	alias MessageBoxExA = STDWINAPI.MessageBoxExA;
	alias MessageBoxIndirectA = STDWINAPI.MessageBoxIndirectA;
	alias GetWindowLongA = STDWINAPI.GetWindowLongA;
	alias SetWindowLongA = STDWINAPI.SetWindowLongA;
	alias GetWindowLongPtrA = STDWINAPI.GetWindowLongPtrA;
	alias SetWindowLongPtrA = STDWINAPI.SetWindowLongPtrA;
	alias GetClassLongA = STDWINAPI.GetClassLongA;
	alias SetClassLongA = STDWINAPI.SetClassLongA;
	alias FindWindowA = STDWINAPI.FindWindowA;
	alias FindWindowExA = STDWINAPI.FindWindowExA;
	alias GetClassNameA = STDWINAPI.GetClassNameA;
	alias SetWindowsHookExA = STDWINAPI.SetWindowsHookExA;
	alias LoadBitmapA = STDWINAPI.LoadBitmapA;
	alias LoadCursorA = STDWINAPI.LoadCursorA;
	alias LoadCursorFromFileA = STDWINAPI.LoadCursorFromFileA;
	alias LoadIconA = STDWINAPI.LoadIconA;
	alias LoadImageA = STDWINAPI.LoadImageA;
	alias LoadStringA = STDWINAPI.LoadStringA;
	alias IsDialogMessageA = STDWINAPI.IsDialogMessageA;
	alias DlgDirListA = STDWINAPI.DlgDirListA;
	alias DlgDirSelectExA = STDWINAPI.DlgDirSelectExA;
	alias DlgDirListComboBoxA = STDWINAPI.DlgDirListComboBoxA;
	alias DlgDirSelectComboBoxExA = STDWINAPI.DlgDirSelectComboBoxExA;
	alias DefFrameProcA = STDWINAPI.DefFrameProcA;
	alias DefMDIChildProcA = STDWINAPI.DefMDIChildProcA;
	alias CreateMDIWindowA = STDWINAPI.CreateMDIWindowA;
	alias WinHelpA = STDWINAPI.WinHelpA;
	alias ChangeDisplaySettingsA = STDWINAPI.ChangeDisplaySettingsA;
	alias EnumDisplaySettingsA = STDWINAPI.EnumDisplaySettingsA;
	alias SystemParametersInfoA = STDWINAPI.SystemParametersInfoA;
	alias AddFontResourceA = STDWINAPI.AddFontResourceA;
	alias CopyMetaFileA = STDWINAPI.CopyMetaFileA;
	alias CreateFontIndirectA = STDWINAPI.CreateFontIndirectA;
	alias CreateICA = STDWINAPI.CreateICA;
	alias CreateMetaFileA = STDWINAPI.CreateMetaFileA;
	alias CreateScalableFontResourceA = STDWINAPI.CreateScalableFontResourceA;
	alias EnumFontFamiliesExA = STDWINAPI.EnumFontFamiliesExA;
	alias EnumFontFamiliesA = STDWINAPI.EnumFontFamiliesA;
	alias EnumFontsA = STDWINAPI.EnumFontsA;
	alias GetCharWidthA = STDWINAPI.GetCharWidthA;
	alias GetCharWidth32A = STDWINAPI.GetCharWidth32A;
	alias GetCharWidthFloatA = STDWINAPI.GetCharWidthFloatA;
	alias GetCharABCWidthsA = STDWINAPI.GetCharABCWidthsA;
	alias GetCharABCWidthsFloatA = STDWINAPI.GetCharABCWidthsFloatA;
	alias GetGlyphOutlineA = STDWINAPI.GetGlyphOutlineA;
	alias GetMetaFileA = STDWINAPI.GetMetaFileA;
	alias GetOutlineTextMetricsA = STDWINAPI.GetOutlineTextMetricsA;
	alias GetTextExtentPointA = STDWINAPI.GetTextExtentPointA;
	alias GetTextExtentPoint32A = STDWINAPI.GetTextExtentPoint32A;
	alias GetTextExtentExPointA = STDWINAPI.GetTextExtentExPointA;
	alias GetCharacterPlacementA = STDWINAPI.GetCharacterPlacementA;
	alias ResetDCA = STDWINAPI.ResetDCA;
	alias RemoveFontResourceA = STDWINAPI.RemoveFontResourceA;
	alias CopyEnhMetaFileA = STDWINAPI.CopyEnhMetaFileA;
	alias CreateEnhMetaFileA = STDWINAPI.CreateEnhMetaFileA;
	alias GetEnhMetaFileA = STDWINAPI.GetEnhMetaFileA;
	alias GetEnhMetaFileDescriptionA = STDWINAPI.GetEnhMetaFileDescriptionA;
	alias GetTextMetricsA = STDWINAPI.GetTextMetricsA;
	alias StartDocA = STDWINAPI.StartDocA;
	alias GetObjectA = STDWINAPI.GetObjectA;
	alias TextOutA = STDWINAPI.TextOutA;
	alias ExtTextOutA = STDWINAPI.ExtTextOutA;
	alias PolyTextOutA = STDWINAPI.PolyTextOutA;
	alias GetTextFaceA = STDWINAPI.GetTextFaceA;
	alias GetKerningPairsA = STDWINAPI.GetKerningPairsA;
	alias CreateColorSpaceA = STDWINAPI.CreateColorSpaceA;
	alias GetLogColorSpaceA = STDWINAPI.GetLogColorSpaceA;
	alias GetICMProfileA = STDWINAPI.GetICMProfileA;
	alias SetICMProfileA = STDWINAPI.SetICMProfileA;
	alias UpdateICMRegKeyA = STDWINAPI.UpdateICMRegKeyA;
	alias EnumICMProfilesA = STDWINAPI.EnumICMProfilesA;
	alias PropertySheetA = STDWINAPI.PropertySheetA;
	alias ImageList_LoadImageA = STDWINAPI.ImageList_LoadImageA;
	alias CreateStatusWindowA = STDWINAPI.CreateStatusWindowA;
	alias DrawStatusTextA = STDWINAPI.DrawStatusTextA;
	alias GetOpenFileNameA = STDWINAPI.GetOpenFileNameA;
	alias GetSaveFileNameA = STDWINAPI.GetSaveFileNameA;
	alias GetFileTitleA = STDWINAPI.GetFileTitleA;
	alias ChooseColorA = STDWINAPI.ChooseColorA;
	alias FindTextA = STDWINAPI.FindTextA;
	alias ReplaceTextA = STDWINAPI.ReplaceTextA;
	alias ChooseFontA = STDWINAPI.ChooseFontA;
	alias PrintDlgA = STDWINAPI.PrintDlgA;
	alias PageSetupDlgA = STDWINAPI.PageSetupDlgA;
	alias CreateProcessA = STDWINAPI.CreateProcessA;
	alias GetStartupInfoA = STDWINAPI.GetStartupInfoA;
	alias FindFirstFileA = STDWINAPI.FindFirstFileA;
	alias FindNextFileA = STDWINAPI.FindNextFileA;
	alias GetVersionExA = STDWINAPI.GetVersionExA;
	alias CreateDCA = STDWINAPI.CreateDCA;
	alias VerInstallFileA = STDWINAPI.VerInstallFileA;
	alias GetFileVersionInfoSizeA = STDWINAPI.GetFileVersionInfoSizeA;
	alias GetFileVersionInfoA = STDWINAPI.GetFileVersionInfoA;
	alias VerLanguageNameA = STDWINAPI.VerLanguageNameA;
	alias VerQueryValueA = STDWINAPI.VerQueryValueA;
	alias VerFindFileA = STDWINAPI.VerFindFileA;
	alias RegConnectRegistryA = STDWINAPI.RegConnectRegistryA;
	alias RegCreateKeyA = STDWINAPI.RegCreateKeyA;
	alias RegCreateKeyExA = STDWINAPI.RegCreateKeyExA;
	alias RegDeleteKeyA = STDWINAPI.RegDeleteKeyA;
	alias RegDeleteValueA = STDWINAPI.RegDeleteValueA;
	alias RegEnumKeyA = STDWINAPI.RegEnumKeyA;
	alias RegEnumKeyExA = STDWINAPI.RegEnumKeyExA;
	alias RegEnumValueA = STDWINAPI.RegEnumValueA;
	alias RegLoadKeyA = STDWINAPI.RegLoadKeyA;
	alias RegOpenKeyA = STDWINAPI.RegOpenKeyA;
	alias RegOpenKeyExA = STDWINAPI.RegOpenKeyExA;
	alias RegQueryInfoKeyA = STDWINAPI.RegQueryInfoKeyA;
	alias RegQueryValueA = STDWINAPI.RegQueryValueA;
	alias RegQueryMultipleValuesA = STDWINAPI.RegQueryMultipleValuesA;
	alias RegQueryValueExA = STDWINAPI.RegQueryValueExA;
	alias RegReplaceKeyA = STDWINAPI.RegReplaceKeyA;
	alias RegRestoreKeyA = STDWINAPI.RegRestoreKeyA;
	alias RegSaveKeyA = STDWINAPI.RegSaveKeyA;
	alias RegSetValueA = STDWINAPI.RegSetValueA;
	alias RegSetValueExA = STDWINAPI.RegSetValueExA;
	alias RegUnLoadKeyA = STDWINAPI.RegUnLoadKeyA;
	alias InitiateSystemShutdownA = STDWINAPI.InitiateSystemShutdownA;
	alias AbortSystemShutdownA = STDWINAPI.AbortSystemShutdownA;
	alias CompareStringA = STDWINAPI.CompareStringA;
	alias LCMapStringA = STDWINAPI.LCMapStringA;
	alias GetLocaleInfoA = STDWINAPI.GetLocaleInfoA;
	alias SetLocaleInfoA = STDWINAPI.SetLocaleInfoA;
	alias GetTimeFormatA = STDWINAPI.GetTimeFormatA;
	alias GetDateFormatA = STDWINAPI.GetDateFormatA;
	alias GetNumberFormatA = STDWINAPI.GetNumberFormatA;
	alias GetCurrencyFormatA = STDWINAPI.GetCurrencyFormatA;
	alias EnumCalendarInfoA = STDWINAPI.EnumCalendarInfoA;
	alias EnumTimeFormatsA = STDWINAPI.EnumTimeFormatsA;
	alias EnumDateFormatsA = STDWINAPI.EnumDateFormatsA;
	alias GetStringTypeExA = STDWINAPI.GetStringTypeExA;
	alias GetStringTypeA = STDWINAPI.GetStringTypeA;
	alias FoldStringA = STDWINAPI.FoldStringA;
	alias EnumSystemLocalesA = STDWINAPI.EnumSystemLocalesA;
	alias EnumSystemCodePagesA = STDWINAPI.EnumSystemCodePagesA;
	alias PeekConsoleInputA = STDWINAPI.PeekConsoleInputA;
	alias ReadConsoleInputA = STDWINAPI.ReadConsoleInputA;
	alias WriteConsoleInputA = STDWINAPI.WriteConsoleInputA;
	alias ReadConsoleOutputA = STDWINAPI.ReadConsoleOutputA;
	alias WriteConsoleOutputA = STDWINAPI.WriteConsoleOutputA;
	alias ReadConsoleOutputCharacterA = STDWINAPI.ReadConsoleOutputCharacterA;
	alias WriteConsoleOutputCharacterA = STDWINAPI.WriteConsoleOutputCharacterA;
	alias FillConsoleOutputCharacterA = STDWINAPI.FillConsoleOutputCharacterA;
	alias ScrollConsoleScreenBufferA = STDWINAPI.ScrollConsoleScreenBufferA;
	alias GetConsoleTitleA = STDWINAPI.GetConsoleTitleA;
	alias SetConsoleTitleA = STDWINAPI.SetConsoleTitleA;
	alias ReadConsoleA = STDWINAPI.ReadConsoleA;
	alias WriteConsoleA = STDWINAPI.WriteConsoleA;
	alias WNetAddConnectionA = STDWINAPI.WNetAddConnectionA;
	alias WNetAddConnection2A = STDWINAPI.WNetAddConnection2A;
	alias WNetAddConnection3A = STDWINAPI.WNetAddConnection3A;
	alias WNetCancelConnectionA = STDWINAPI.WNetCancelConnectionA;
	alias WNetCancelConnection2A = STDWINAPI.WNetCancelConnection2A;
	alias WNetGetConnectionA = STDWINAPI.WNetGetConnectionA;
	alias WNetUseConnectionA = STDWINAPI.WNetUseConnectionA;
	alias WNetSetConnectionA = STDWINAPI.WNetSetConnectionA;
	alias WNetConnectionDialog1A = STDWINAPI.WNetConnectionDialog1A;
	alias WNetDisconnectDialog1A = STDWINAPI.WNetDisconnectDialog1A;
	alias WNetOpenEnumA = STDWINAPI.WNetOpenEnumA;
	alias WNetEnumResourceA = STDWINAPI.WNetEnumResourceA;
	alias WNetGetUniversalNameA = STDWINAPI.WNetGetUniversalNameA;
	alias WNetGetUserA = STDWINAPI.WNetGetUserA;
	alias WNetGetProviderNameA = STDWINAPI.WNetGetProviderNameA;
	alias WNetGetNetworkInformationA = STDWINAPI.WNetGetNetworkInformationA;
	alias WNetGetLastErrorA = STDWINAPI.WNetGetLastErrorA;
	alias MultinetGetConnectionPerformanceA = STDWINAPI.MultinetGetConnectionPerformanceA;
	alias ChangeServiceConfigA = STDWINAPI.ChangeServiceConfigA;
	alias CreateServiceA = STDWINAPI.CreateServiceA;
	alias EnumDependentServicesA = STDWINAPI.EnumDependentServicesA;
	alias EnumServicesStatusA = STDWINAPI.EnumServicesStatusA;
	alias GetServiceKeyNameA = STDWINAPI.GetServiceKeyNameA;
	alias GetServiceDisplayNameA = STDWINAPI.GetServiceDisplayNameA;
	alias OpenSCManagerA = STDWINAPI.OpenSCManagerA;
	alias OpenServiceA = STDWINAPI.OpenServiceA;
	alias QueryServiceConfigA = STDWINAPI.QueryServiceConfigA;
	alias QueryServiceLockStatusA = STDWINAPI.QueryServiceLockStatusA;
	alias RegisterServiceCtrlHandlerA = STDWINAPI.RegisterServiceCtrlHandlerA;
	alias StartServiceCtrlDispatcherA = STDWINAPI.StartServiceCtrlDispatcherA;
	alias StartServiceA = STDWINAPI.StartServiceA;
	alias DragQueryFileA = STDWINAPI.DragQueryFileA;
	alias ExtractAssociatedIconA = STDWINAPI.ExtractAssociatedIconA;
	alias ExtractIconA = STDWINAPI.ExtractIconA;
	alias FindExecutableA = STDWINAPI.FindExecutableA;
	alias ShellAboutA = STDWINAPI.ShellAboutA;
	alias ShellExecuteA = STDWINAPI.ShellExecuteA;
	alias DdeCreateStringHandleA = STDWINAPI.DdeCreateStringHandleA;
	alias DdeInitializeA = STDWINAPI.DdeInitializeA;
	alias DdeQueryStringA = STDWINAPI.DdeQueryStringA;
	alias LogonUserA = STDWINAPI.LogonUserA;
	extern (Windows) WINBOOL CreateProcessAsUserA(HANDLE, LPCSTR, LPSTR, LPSECURITY_ATTRIBUTES,
			LPSECURITY_ATTRIBUTES, WINBOOL, DWORD, LPVOID, LPCSTR,
			LPSTARTUPINFO, LPPROCESS_INFORMATION); //Workaround Tango bug
	alias GetBinaryTypeW = STDWINAPI.GetBinaryTypeW;
	alias GetShortPathNameW = STDWINAPI.GetShortPathNameW;
	alias GetEnvironmentStringsW = STDWINAPI.GetEnvironmentStringsW;
	alias FreeEnvironmentStringsW = STDWINAPI.FreeEnvironmentStringsW;
	alias FormatMessageW = STDWINAPI.FormatMessageW;
	alias CreateMailslotW = STDWINAPI.CreateMailslotW;
	alias lstrcmpW = STDWINAPI.lstrcmpW;
	alias lstrcmpiW = STDWINAPI.lstrcmpiW;
	alias lstrcpynW = STDWINAPI.lstrcpynW;
	alias lstrcpyW = STDWINAPI.lstrcpyW;
	alias lstrcatW = STDWINAPI.lstrcatW;
	alias lstrlenW = STDWINAPI.lstrlenW;
	alias CreateMutexW = STDWINAPI.CreateMutexW;
	alias OpenMutexW = STDWINAPI.OpenMutexW;
	alias CreateEventW = STDWINAPI.CreateEventW;
	alias OpenEventW = STDWINAPI.OpenEventW;
	alias CreateSemaphoreW = STDWINAPI.CreateSemaphoreW;
	alias OpenSemaphoreW = STDWINAPI.OpenSemaphoreW;
	alias CreateFileMappingW = STDWINAPI.CreateFileMappingW;
	alias OpenFileMappingW = STDWINAPI.OpenFileMappingW;
	alias GetLogicalDriveStringsW = STDWINAPI.GetLogicalDriveStringsW;
	alias LoadLibraryW = STDWINAPI.LoadLibraryW;
	alias LoadLibraryExW = STDWINAPI.LoadLibraryExW;
	alias GetModuleFileNameW = STDWINAPI.GetModuleFileNameW;
	alias GetModuleHandleW = STDWINAPI.GetModuleHandleW;
	alias FatalAppExitW = STDWINAPI.FatalAppExitW;
	alias GetCommandLineW = STDWINAPI.GetCommandLineW;
	alias GetEnvironmentVariableW = STDWINAPI.GetEnvironmentVariableW;
	alias SetEnvironmentVariableW = STDWINAPI.SetEnvironmentVariableW;
	alias ExpandEnvironmentStringsW = STDWINAPI.ExpandEnvironmentStringsW;
	alias OutputDebugStringW = STDWINAPI.OutputDebugStringW;
	alias FindResourceW = STDWINAPI.FindResourceW;
	alias FindResourceExW = STDWINAPI.FindResourceExW;
	alias EnumResourceTypesW = STDWINAPI.EnumResourceTypesW;
	alias EnumResourceNamesW = STDWINAPI.EnumResourceNamesW;
	alias EnumResourceLanguagesW = STDWINAPI.EnumResourceLanguagesW;
	alias BeginUpdateResourceW = STDWINAPI.BeginUpdateResourceW;
	alias UpdateResourceW = STDWINAPI.UpdateResourceW;
	alias EndUpdateResourceW = STDWINAPI.EndUpdateResourceW;
	alias GlobalAddAtomW = STDWINAPI.GlobalAddAtomW;
	alias GlobalFindAtomW = STDWINAPI.GlobalFindAtomW;
	alias GlobalGetAtomNameW = STDWINAPI.GlobalGetAtomNameW;
	alias AddAtomW = STDWINAPI.AddAtomW;
	alias FindAtomW = STDWINAPI.FindAtomW;
	alias GetAtomNameW = STDWINAPI.GetAtomNameW;
	alias GetProfileIntW = STDWINAPI.GetProfileIntW;
	alias GetProfileStringW = STDWINAPI.GetProfileStringW;
	alias WriteProfileStringW = STDWINAPI.WriteProfileStringW;
	alias GetProfileSectionW = STDWINAPI.GetProfileSectionW;
	alias WriteProfileSectionW = STDWINAPI.WriteProfileSectionW;
	alias GetPrivateProfileIntW = STDWINAPI.GetPrivateProfileIntW;
	alias GetPrivateProfileStringW = STDWINAPI.GetPrivateProfileStringW;
	alias WritePrivateProfileStringW = STDWINAPI.WritePrivateProfileStringW;
	alias GetPrivateProfileSectionW = STDWINAPI.GetPrivateProfileSectionW;
	alias WritePrivateProfileSectionW = STDWINAPI.WritePrivateProfileSectionW;
	alias GetDriveTypeW = STDWINAPI.GetDriveTypeW;
	alias GetSystemDirectoryW = STDWINAPI.GetSystemDirectoryW;
	alias GetTempPathW = STDWINAPI.GetTempPathW;
	alias GetTempFileNameW = STDWINAPI.GetTempFileNameW;
	alias GetWindowsDirectoryW = STDWINAPI.GetWindowsDirectoryW;
	alias SetCurrentDirectoryW = STDWINAPI.SetCurrentDirectoryW;
	alias GetCurrentDirectoryW = STDWINAPI.GetCurrentDirectoryW;
	alias GetDiskFreeSpaceW = STDWINAPI.GetDiskFreeSpaceW;
	alias CreateDirectoryW = STDWINAPI.CreateDirectoryW;
	alias CreateDirectoryExW = STDWINAPI.CreateDirectoryExW;
	alias RemoveDirectoryW = STDWINAPI.RemoveDirectoryW;
	alias GetFullPathNameW = STDWINAPI.GetFullPathNameW;
	alias DefineDosDeviceW = STDWINAPI.DefineDosDeviceW;
	alias QueryDosDeviceW = STDWINAPI.QueryDosDeviceW;
	alias CreateFileW = STDWINAPI.CreateFileW;
	alias SetFileAttributesW = STDWINAPI.SetFileAttributesW;
	alias GetFileAttributesW = STDWINAPI.GetFileAttributesW;
	alias GetFileAttributesExW = STDWINAPI.GetFileAttributesExW;
	alias GetCompressedFileSizeW = STDWINAPI.GetCompressedFileSizeW;
	alias DeleteFileW = STDWINAPI.DeleteFileW;
	alias SearchPathW = STDWINAPI.SearchPathW;
	alias CopyFileW = STDWINAPI.CopyFileW;
	alias MoveFileW = STDWINAPI.MoveFileW;
	alias MoveFileExW = STDWINAPI.MoveFileExW;
	alias CreateNamedPipeW = STDWINAPI.CreateNamedPipeW;
	alias GetNamedPipeHandleStateW = STDWINAPI.GetNamedPipeHandleStateW;
	alias CallNamedPipeW = STDWINAPI.CallNamedPipeW;
	alias WaitNamedPipeW = STDWINAPI.WaitNamedPipeW;
	alias SetVolumeLabelW = STDWINAPI.SetVolumeLabelW;
	alias GetVolumeInformationW = STDWINAPI.GetVolumeInformationW;
	alias ClearEventLogW = STDWINAPI.ClearEventLogW;
	alias BackupEventLogW = STDWINAPI.BackupEventLogW;
	alias OpenEventLogW = STDWINAPI.OpenEventLogW;
	alias RegisterEventSourceW = STDWINAPI.RegisterEventSourceW;
	alias OpenBackupEventLogW = STDWINAPI.OpenBackupEventLogW;
	alias ReadEventLogW = STDWINAPI.ReadEventLogW;
	alias ReportEventW = STDWINAPI.ReportEventW;
	alias AccessCheckAndAuditAlarmW = STDWINAPI.AccessCheckAndAuditAlarmW;
	alias ObjectOpenAuditAlarmW = STDWINAPI.ObjectOpenAuditAlarmW;
	alias ObjectPrivilegeAuditAlarmW = STDWINAPI.ObjectPrivilegeAuditAlarmW;
	alias ObjectCloseAuditAlarmW = STDWINAPI.ObjectCloseAuditAlarmW;
	alias PrivilegedServiceAuditAlarmW = STDWINAPI.PrivilegedServiceAuditAlarmW;
	alias SetFileSecurityW = STDWINAPI.SetFileSecurityW;
	alias GetFileSecurityW = STDWINAPI.GetFileSecurityW;
	alias FindFirstChangeNotificationW = STDWINAPI.FindFirstChangeNotificationW;
	alias IsBadStringPtrW = STDWINAPI.IsBadStringPtrW;
	alias LookupAccountSidW = STDWINAPI.LookupAccountSidW;
	alias LookupAccountNameW = STDWINAPI.LookupAccountNameW;
	alias LookupPrivilegeValueW = STDWINAPI.LookupPrivilegeValueW;
	alias LookupPrivilegeNameW = STDWINAPI.LookupPrivilegeNameW;
	alias LookupPrivilegeDisplayNameW = STDWINAPI.LookupPrivilegeDisplayNameW;
	alias BuildCommDCBW = STDWINAPI.BuildCommDCBW;
	alias BuildCommDCBAndTimeoutsW = STDWINAPI.BuildCommDCBAndTimeoutsW;
	alias CommConfigDialogW = STDWINAPI.CommConfigDialogW;
	alias GetDefaultCommConfigW = STDWINAPI.GetDefaultCommConfigW;
	alias SetDefaultCommConfigW = STDWINAPI.SetDefaultCommConfigW;
	alias GetComputerNameW = STDWINAPI.GetComputerNameW;
	alias SetComputerNameW = STDWINAPI.SetComputerNameW;
	alias GetUserNameW = STDWINAPI.GetUserNameW;
	alias wvsprintfW = STDWINAPI.wvsprintfW;
	alias LoadKeyboardLayoutW = STDWINAPI.LoadKeyboardLayoutW;
	alias GetKeyboardLayoutNameW = STDWINAPI.GetKeyboardLayoutNameW;
	alias CreateDesktopW = STDWINAPI.CreateDesktopW;
	alias OpenDesktopW = STDWINAPI.OpenDesktopW;
	alias EnumDesktopsW = STDWINAPI.EnumDesktopsW;
	alias CreateWindowStationW = STDWINAPI.CreateWindowStationW;
	alias OpenWindowStationW = STDWINAPI.OpenWindowStationW;
	alias EnumWindowStationsW = STDWINAPI.EnumWindowStationsW;
	alias GetUserObjectInformationW = STDWINAPI.GetUserObjectInformationW;
	alias SetUserObjectInformationW = STDWINAPI.SetUserObjectInformationW;
	alias RegisterWindowMessageW = STDWINAPI.RegisterWindowMessageW;
	alias GetMessageW = STDWINAPI.GetMessageW;
	alias DispatchMessageW = STDWINAPI.DispatchMessageW;
	alias PeekMessageW = STDWINAPI.PeekMessageW;
	alias SendMessageW = STDWINAPI.SendMessageW;
	alias SendMessageW = STDWINAPI.SendMessageW;
	alias SendMessageW = STDWINAPI.SendMessageW;
	alias SendMessageW = STDWINAPI.SendMessageW;
	alias SendMessageTimeoutW = STDWINAPI.SendMessageTimeoutW;
	alias SendNotifyMessageW = STDWINAPI.SendNotifyMessageW;
	alias SendMessageCallbackW = STDWINAPI.SendMessageCallbackW;
	alias PostMessageW = STDWINAPI.PostMessageW;
	alias PostThreadMessageW = STDWINAPI.PostThreadMessageW;
	alias DefWindowProcW = STDWINAPI.DefWindowProcW;
	alias CallWindowProcW = STDWINAPI.CallWindowProcW;
	alias RegisterClassW = STDWINAPI.RegisterClassW;
	alias UnregisterClassW = STDWINAPI.UnregisterClassW;
	alias GetClassInfoW = STDWINAPI.GetClassInfoW;
	alias RegisterClassExW = STDWINAPI.RegisterClassExW;
	alias GetClassInfoExW = STDWINAPI.GetClassInfoExW;
	alias CreateWindowExW = STDWINAPI.CreateWindowExW;
	alias CreateDialogParamW = STDWINAPI.CreateDialogParamW;
	alias CreateDialogIndirectParamW = STDWINAPI.CreateDialogIndirectParamW;
	alias DialogBoxParamW = STDWINAPI.DialogBoxParamW;
	alias DialogBoxIndirectParamW = STDWINAPI.DialogBoxIndirectParamW;
	alias SetDlgItemTextW = STDWINAPI.SetDlgItemTextW;
	alias GetDlgItemTextW = STDWINAPI.GetDlgItemTextW;
	alias SendDlgItemMessageW = STDWINAPI.SendDlgItemMessageW;
	alias DefDlgProcW = STDWINAPI.DefDlgProcW;
	alias CallMsgFilterW = STDWINAPI.CallMsgFilterW;
	alias RegisterClipboardFormatW = STDWINAPI.RegisterClipboardFormatW;
	alias GetClipboardFormatNameW = STDWINAPI.GetClipboardFormatNameW;
	alias CharToOemW = STDWINAPI.CharToOemW;
	alias OemToCharW = STDWINAPI.OemToCharW;
	alias CharToOemBuffW = STDWINAPI.CharToOemBuffW;
	alias OemToCharBuffW = STDWINAPI.OemToCharBuffW;
	alias CharUpperW = STDWINAPI.CharUpperW;
	alias CharUpperBuffW = STDWINAPI.CharUpperBuffW;
	alias CharLowerW = STDWINAPI.CharLowerW;
	alias CharLowerBuffW = STDWINAPI.CharLowerBuffW;
	alias CharNextW = STDWINAPI.CharNextW;
	alias CharPrevW = STDWINAPI.CharPrevW;
	alias IsCharAlphaW = STDWINAPI.IsCharAlphaW;
	alias IsCharAlphaNumericW = STDWINAPI.IsCharAlphaNumericW;
	alias IsCharUpperW = STDWINAPI.IsCharUpperW;
	alias IsCharLowerW = STDWINAPI.IsCharLowerW;
	alias GetKeyNameTextW = STDWINAPI.GetKeyNameTextW;
	alias VkKeyScanW = STDWINAPI.VkKeyScanW;
	alias VkKeyScanExW = STDWINAPI.VkKeyScanExW;
	alias MapVirtualKeyW = STDWINAPI.MapVirtualKeyW;
	alias MapVirtualKeyExW = STDWINAPI.MapVirtualKeyExW;
	alias LoadAcceleratorsW = STDWINAPI.LoadAcceleratorsW;
	alias CreateAcceleratorTableW = STDWINAPI.CreateAcceleratorTableW;
	alias CopyAcceleratorTableW = STDWINAPI.CopyAcceleratorTableW;
	alias TranslateAcceleratorW = STDWINAPI.TranslateAcceleratorW;
	alias LoadMenuW = STDWINAPI.LoadMenuW;
	alias LoadMenuIndirectW = STDWINAPI.LoadMenuIndirectW;
	alias ChangeMenuW = STDWINAPI.ChangeMenuW;
	alias GetMenuStringW = STDWINAPI.GetMenuStringW;
	alias InsertMenuW = STDWINAPI.InsertMenuW;
	alias AppendMenuW = STDWINAPI.AppendMenuW;
	alias ModifyMenuW = STDWINAPI.ModifyMenuW;
	alias InsertMenuItemW = STDWINAPI.InsertMenuItemW;
	alias GetMenuItemInfoW = STDWINAPI.GetMenuItemInfoW;
	alias SetMenuItemInfoW = STDWINAPI.SetMenuItemInfoW;
	alias DrawTextW = STDWINAPI.DrawTextW;
	alias DrawTextExW = STDWINAPI.DrawTextExW;
	alias GrayStringW = STDWINAPI.GrayStringW;
	alias DrawStateW = STDWINAPI.DrawStateW;
	alias TabbedTextOutW = STDWINAPI.TabbedTextOutW;
	alias GetTabbedTextExtentW = STDWINAPI.GetTabbedTextExtentW;
	alias SetPropW = STDWINAPI.SetPropW;
	alias GetPropW = STDWINAPI.GetPropW;
	alias RemovePropW = STDWINAPI.RemovePropW;
	alias EnumPropsExW = STDWINAPI.EnumPropsExW;
	alias EnumPropsW = STDWINAPI.EnumPropsW;
	alias SetWindowTextW = STDWINAPI.SetWindowTextW;
	alias GetWindowTextW = STDWINAPI.GetWindowTextW;
	alias GetWindowTextLengthW = STDWINAPI.GetWindowTextLengthW;
	alias MessageBoxW = STDWINAPI.MessageBoxW;
	alias MessageBoxExW = STDWINAPI.MessageBoxExW;
	alias MessageBoxIndirectW = STDWINAPI.MessageBoxIndirectW;
	alias GetWindowLongW = STDWINAPI.GetWindowLongW;
	alias SetWindowLongW = STDWINAPI.SetWindowLongW;
	alias GetWindowLongPtrW = STDWINAPI.GetWindowLongPtrW;
	alias SetWindowLongPtrW = STDWINAPI.SetWindowLongPtrW;
	alias GetClassLongW = STDWINAPI.GetClassLongW;
	alias SetClassLongW = STDWINAPI.SetClassLongW;
	alias FindWindowW = STDWINAPI.FindWindowW;
	alias FindWindowExW = STDWINAPI.FindWindowExW;
	alias GetClassNameW = STDWINAPI.GetClassNameW;
	alias SetWindowsHookExW = STDWINAPI.SetWindowsHookExW;
	alias LoadBitmapW = STDWINAPI.LoadBitmapW;
	alias LoadCursorW = STDWINAPI.LoadCursorW;
	alias LoadCursorFromFileW = STDWINAPI.LoadCursorFromFileW;
	alias LoadIconW = STDWINAPI.LoadIconW;
	alias LoadImageW = STDWINAPI.LoadImageW;
	alias LoadStringW = STDWINAPI.LoadStringW;
	alias IsDialogMessageW = STDWINAPI.IsDialogMessageW;
	alias DlgDirListW = STDWINAPI.DlgDirListW;
	alias DlgDirSelectExW = STDWINAPI.DlgDirSelectExW;
	alias DlgDirListComboBoxW = STDWINAPI.DlgDirListComboBoxW;
	alias DlgDirSelectComboBoxExW = STDWINAPI.DlgDirSelectComboBoxExW;
	alias DefFrameProcW = STDWINAPI.DefFrameProcW;
	alias DefMDIChildProcW = STDWINAPI.DefMDIChildProcW;
	alias CreateMDIWindowW = STDWINAPI.CreateMDIWindowW;
	alias WinHelpW = STDWINAPI.WinHelpW;
	alias ChangeDisplaySettingsW = STDWINAPI.ChangeDisplaySettingsW;
	alias EnumDisplaySettingsW = STDWINAPI.EnumDisplaySettingsW;
	alias SystemParametersInfoW = STDWINAPI.SystemParametersInfoW;
	alias AddFontResourceW = STDWINAPI.AddFontResourceW;
	alias CopyMetaFileW = STDWINAPI.CopyMetaFileW;
	alias CreateFontIndirectW = STDWINAPI.CreateFontIndirectW;
	alias CreateFontW = STDWINAPI.CreateFontW;
	alias CreateICW = STDWINAPI.CreateICW;
	alias CreateMetaFileW = STDWINAPI.CreateMetaFileW;
	alias CreateScalableFontResourceW = STDWINAPI.CreateScalableFontResourceW;
	alias EnumFontFamiliesExW = STDWINAPI.EnumFontFamiliesExW;
	alias EnumFontFamiliesW = STDWINAPI.EnumFontFamiliesW;
	alias EnumFontsW = STDWINAPI.EnumFontsW;
	alias GetCharWidthW = STDWINAPI.GetCharWidthW;
	alias GetCharWidth32W = STDWINAPI.GetCharWidth32W;
	alias GetCharWidthFloatW = STDWINAPI.GetCharWidthFloatW;
	alias GetCharABCWidthsW = STDWINAPI.GetCharABCWidthsW;
	alias GetCharABCWidthsFloatW = STDWINAPI.GetCharABCWidthsFloatW;
	alias GetGlyphOutlineW = STDWINAPI.GetGlyphOutlineW;
	alias GetMetaFileW = STDWINAPI.GetMetaFileW;
	alias GetOutlineTextMetricsW = STDWINAPI.GetOutlineTextMetricsW;
	alias GetTextExtentPointW = STDWINAPI.GetTextExtentPointW;
	alias GetTextExtentPoint32W = STDWINAPI.GetTextExtentPoint32W;
	alias GetTextExtentExPointW = STDWINAPI.GetTextExtentExPointW;
	alias GetCharacterPlacementW = STDWINAPI.GetCharacterPlacementW;
	alias ResetDCW = STDWINAPI.ResetDCW;
	alias RemoveFontResourceW = STDWINAPI.RemoveFontResourceW;
	alias CopyEnhMetaFileW = STDWINAPI.CopyEnhMetaFileW;
	alias CreateEnhMetaFileW = STDWINAPI.CreateEnhMetaFileW;
	alias GetEnhMetaFileW = STDWINAPI.GetEnhMetaFileW;
	alias GetEnhMetaFileDescriptionW = STDWINAPI.GetEnhMetaFileDescriptionW;
	alias GetTextMetricsW = STDWINAPI.GetTextMetricsW;
	alias StartDocW = STDWINAPI.StartDocW;
	alias GetObjectW = STDWINAPI.GetObjectW;
	alias TextOutW = STDWINAPI.TextOutW;
	alias ExtTextOutW = STDWINAPI.ExtTextOutW;
	alias PolyTextOutW = STDWINAPI.PolyTextOutW;
	alias GetTextFaceW = STDWINAPI.GetTextFaceW;
	alias GetKerningPairsW = STDWINAPI.GetKerningPairsW;
	alias GetLogColorSpaceW = STDWINAPI.GetLogColorSpaceW;
	alias CreateColorSpaceW = STDWINAPI.CreateColorSpaceW;
	alias GetICMProfileW = STDWINAPI.GetICMProfileW;
	alias SetICMProfileW = STDWINAPI.SetICMProfileW;
	alias UpdateICMRegKeyW = STDWINAPI.UpdateICMRegKeyW;
	alias EnumICMProfilesW = STDWINAPI.EnumICMProfilesW;
	alias CreatePropertySheetPageW = STDWINAPI.CreatePropertySheetPageW;
	alias PropertySheetW = STDWINAPI.PropertySheetW;
	alias ImageList_LoadImageW = STDWINAPI.ImageList_LoadImageW;
	alias CreateStatusWindowW = STDWINAPI.CreateStatusWindowW;
	alias DrawStatusTextW = STDWINAPI.DrawStatusTextW;
	alias GetOpenFileNameW = STDWINAPI.GetOpenFileNameW;
	alias GetSaveFileNameW = STDWINAPI.GetSaveFileNameW;
	alias GetFileTitleW = STDWINAPI.GetFileTitleW;
	alias ChooseColorW = STDWINAPI.ChooseColorW;
	alias ReplaceTextW = STDWINAPI.ReplaceTextW;
	alias ChooseFontW = STDWINAPI.ChooseFontW;
	alias FindTextW = STDWINAPI.FindTextW;
	alias PrintDlgW = STDWINAPI.PrintDlgW;
	alias PageSetupDlgW = STDWINAPI.PageSetupDlgW;
	alias CreateProcessW = STDWINAPI.CreateProcessW;
	alias GetStartupInfoW = STDWINAPI.GetStartupInfoW;
	alias FindFirstFileW = STDWINAPI.FindFirstFileW;
	alias FindNextFileW = STDWINAPI.FindNextFileW;
	alias GetVersionExW = STDWINAPI.GetVersionExW;
	alias CreateDCW = STDWINAPI.CreateDCW;
	alias CreateFontA = STDWINAPI.CreateFontA;
	alias VerInstallFileW = STDWINAPI.VerInstallFileW;
	alias GetFileVersionInfoSizeW = STDWINAPI.GetFileVersionInfoSizeW;
	alias GetFileVersionInfoW = STDWINAPI.GetFileVersionInfoW;
	alias VerLanguageNameW = STDWINAPI.VerLanguageNameW;
	alias VerQueryValueW = STDWINAPI.VerQueryValueW;
	alias VerFindFileW = STDWINAPI.VerFindFileW;
	alias RegSetValueExW = STDWINAPI.RegSetValueExW;
	alias RegUnLoadKeyW = STDWINAPI.RegUnLoadKeyW;
	alias InitiateSystemShutdownW = STDWINAPI.InitiateSystemShutdownW;
	alias AbortSystemShutdownW = STDWINAPI.AbortSystemShutdownW;
	alias RegRestoreKeyW = STDWINAPI.RegRestoreKeyW;
	alias RegSaveKeyW = STDWINAPI.RegSaveKeyW;
	alias RegSetValueW = STDWINAPI.RegSetValueW;
	alias RegQueryValueW = STDWINAPI.RegQueryValueW;
	alias RegQueryMultipleValuesW = STDWINAPI.RegQueryMultipleValuesW;
	alias RegQueryValueExW = STDWINAPI.RegQueryValueExW;
	alias RegReplaceKeyW = STDWINAPI.RegReplaceKeyW;
	alias RegConnectRegistryW = STDWINAPI.RegConnectRegistryW;
	alias RegCreateKeyW = STDWINAPI.RegCreateKeyW;
	alias RegCreateKeyExW = STDWINAPI.RegCreateKeyExW;
	alias RegDeleteKeyW = STDWINAPI.RegDeleteKeyW;
	alias RegDeleteValueW = STDWINAPI.RegDeleteValueW;
	alias RegEnumKeyW = STDWINAPI.RegEnumKeyW;
	alias RegEnumKeyExW = STDWINAPI.RegEnumKeyExW;
	alias RegEnumValueW = STDWINAPI.RegEnumValueW;
	alias RegLoadKeyW = STDWINAPI.RegLoadKeyW;
	alias RegOpenKeyW = STDWINAPI.RegOpenKeyW;
	alias RegOpenKeyExW = STDWINAPI.RegOpenKeyExW;
	alias RegQueryInfoKeyW = STDWINAPI.RegQueryInfoKeyW;
	alias CompareStringW = STDWINAPI.CompareStringW;
	alias LCMapStringW = STDWINAPI.LCMapStringW;
	alias GetLocaleInfoW = STDWINAPI.GetLocaleInfoW;
	alias SetLocaleInfoW = STDWINAPI.SetLocaleInfoW;
	alias GetTimeFormatW = STDWINAPI.GetTimeFormatW;
	alias GetDateFormatW = STDWINAPI.GetDateFormatW;
	alias GetNumberFormatW = STDWINAPI.GetNumberFormatW;
	alias GetCurrencyFormatW = STDWINAPI.GetCurrencyFormatW;
	alias EnumCalendarInfoW = STDWINAPI.EnumCalendarInfoW;
	alias EnumTimeFormatsW = STDWINAPI.EnumTimeFormatsW;
	alias EnumDateFormatsW = STDWINAPI.EnumDateFormatsW;
	alias GetStringTypeExW = STDWINAPI.GetStringTypeExW;
	alias GetStringTypeW = STDWINAPI.GetStringTypeW;
	alias FoldStringW = STDWINAPI.FoldStringW;
	alias EnumSystemLocalesW = STDWINAPI.EnumSystemLocalesW;
	alias EnumSystemCodePagesW = STDWINAPI.EnumSystemCodePagesW;
	alias PeekConsoleInputW = STDWINAPI.PeekConsoleInputW;
	alias ReadConsoleInputW = STDWINAPI.ReadConsoleInputW;
	alias WriteConsoleInputW = STDWINAPI.WriteConsoleInputW;
	alias ReadConsoleOutputW = STDWINAPI.ReadConsoleOutputW;
	alias WriteConsoleOutputW = STDWINAPI.WriteConsoleOutputW;
	alias ReadConsoleOutputCharacterW = STDWINAPI.ReadConsoleOutputCharacterW;
	alias WriteConsoleOutputCharacterW = STDWINAPI.WriteConsoleOutputCharacterW;
	alias FillConsoleOutputCharacterW = STDWINAPI.FillConsoleOutputCharacterW;
	alias ScrollConsoleScreenBufferW = STDWINAPI.ScrollConsoleScreenBufferW;
	alias GetConsoleTitleW = STDWINAPI.GetConsoleTitleW;
	alias SetConsoleTitleW = STDWINAPI.SetConsoleTitleW;
	alias ReadConsoleW = STDWINAPI.ReadConsoleW;
	alias WriteConsoleW = STDWINAPI.WriteConsoleW;
	alias WNetAddConnectionW = STDWINAPI.WNetAddConnectionW;
	alias WNetAddConnection2W = STDWINAPI.WNetAddConnection2W;
	alias WNetAddConnection3W = STDWINAPI.WNetAddConnection3W;
	alias WNetCancelConnectionW = STDWINAPI.WNetCancelConnectionW;
	alias WNetCancelConnection2W = STDWINAPI.WNetCancelConnection2W;
	alias WNetGetConnectionW = STDWINAPI.WNetGetConnectionW;
	alias WNetUseConnectionW = STDWINAPI.WNetUseConnectionW;
	alias WNetSetConnectionW = STDWINAPI.WNetSetConnectionW;
	alias WNetConnectionDialog1W = STDWINAPI.WNetConnectionDialog1W;
	alias WNetDisconnectDialog1W = STDWINAPI.WNetDisconnectDialog1W;
	alias WNetOpenEnumW = STDWINAPI.WNetOpenEnumW;
	alias WNetEnumResourceW = STDWINAPI.WNetEnumResourceW;
	alias WNetGetUniversalNameW = STDWINAPI.WNetGetUniversalNameW;
	alias WNetGetUserW = STDWINAPI.WNetGetUserW;
	alias WNetGetProviderNameW = STDWINAPI.WNetGetProviderNameW;
	alias WNetGetNetworkInformationW = STDWINAPI.WNetGetNetworkInformationW;
	alias WNetGetLastErrorW = STDWINAPI.WNetGetLastErrorW;
	alias MultinetGetConnectionPerformanceW = STDWINAPI.MultinetGetConnectionPerformanceW;
	alias ChangeServiceConfigW = STDWINAPI.ChangeServiceConfigW;
	alias CreateServiceW = STDWINAPI.CreateServiceW;
	alias EnumDependentServicesW = STDWINAPI.EnumDependentServicesW;
	alias EnumServicesStatusW = STDWINAPI.EnumServicesStatusW;
	alias GetServiceKeyNameW = STDWINAPI.GetServiceKeyNameW;
	alias GetServiceDisplayNameW = STDWINAPI.GetServiceDisplayNameW;
	alias OpenSCManagerW = STDWINAPI.OpenSCManagerW;
	alias OpenServiceW = STDWINAPI.OpenServiceW;
	alias QueryServiceConfigW = STDWINAPI.QueryServiceConfigW;
	alias QueryServiceLockStatusW = STDWINAPI.QueryServiceLockStatusW;
	alias RegisterServiceCtrlHandlerW = STDWINAPI.RegisterServiceCtrlHandlerW;
	alias StartServiceCtrlDispatcherW = STDWINAPI.StartServiceCtrlDispatcherW;
	alias StartServiceW = STDWINAPI.StartServiceW;
	alias DragQueryFileW = STDWINAPI.DragQueryFileW;
	alias ExtractAssociatedIconW = STDWINAPI.ExtractAssociatedIconW;
	alias ExtractIconW = STDWINAPI.ExtractIconW;
	alias FindExecutableW = STDWINAPI.FindExecutableW;
	alias ShellAboutW = STDWINAPI.ShellAboutW;
	alias ShellExecuteW = STDWINAPI.ShellExecuteW;
	alias DdeCreateStringHandleW = STDWINAPI.DdeCreateStringHandleW;
	alias DdeInitializeW = STDWINAPI.DdeInitializeW;
	alias DdeQueryStringW = STDWINAPI.DdeQueryStringW;
	alias LogonUserW = STDWINAPI.LogonUserW;
	alias CreateProcessAsUserW = STDWINAPI.CreateProcessAsUserW;
	alias AccessCheck = STDWINAPI.AccessCheck;
	alias InterlockedIncrement = STDWINAPI.InterlockedIncrement;
	alias InterlockedDecrement = STDWINAPI.InterlockedDecrement;
	alias InterlockedExchange = STDWINAPI.InterlockedExchange;
	alias FreeResource = STDWINAPI.FreeResource;
	alias LockResource = STDWINAPI.LockResource;
	alias FreeLibrary = STDWINAPI.FreeLibrary;
	alias FreeLibraryAndExitThread = STDWINAPI.FreeLibraryAndExitThread;
	alias DisableThreadLibraryCalls = STDWINAPI.DisableThreadLibraryCalls;
	alias GetProcAddress = STDWINAPI.GetProcAddress;
	alias GetVersion = STDWINAPI.GetVersion;
	alias GlobalAlloc = STDWINAPI.GlobalAlloc;
	alias GlobalReAlloc = STDWINAPI.GlobalReAlloc;
	alias GlobalSize = STDWINAPI.GlobalSize;
	alias GlobalFlags = STDWINAPI.GlobalFlags;
	alias GlobalLock = STDWINAPI.GlobalLock;
	alias GlobalHandle = STDWINAPI.GlobalHandle;
	alias GlobalUnlock = STDWINAPI.GlobalUnlock;
	alias GlobalFree = STDWINAPI.GlobalFree;
	alias GlobalCompact = STDWINAPI.GlobalCompact;
	alias GlobalFix = STDWINAPI.GlobalFix;
	alias GlobalUnfix = STDWINAPI.GlobalUnfix;
	alias GlobalWire = STDWINAPI.GlobalWire;
	alias GlobalUnWire = STDWINAPI.GlobalUnWire;
	alias GlobalMemoryStatus = STDWINAPI.GlobalMemoryStatus;
	alias LocalAlloc = STDWINAPI.LocalAlloc;
	alias LocalReAlloc = STDWINAPI.LocalReAlloc;
	alias LocalLock = STDWINAPI.LocalLock;
	alias LocalHandle = STDWINAPI.LocalHandle;
	alias LocalUnlock = STDWINAPI.LocalUnlock;
	alias LocalSize = STDWINAPI.LocalSize;
	alias LocalFlags = STDWINAPI.LocalFlags;
	alias LocalFree = STDWINAPI.LocalFree;
	alias LocalShrink = STDWINAPI.LocalShrink;
	alias LocalCompact = STDWINAPI.LocalCompact;
	alias FlushInstructionCache = STDWINAPI.FlushInstructionCache;
	alias VirtualAlloc = STDWINAPI.VirtualAlloc;
	alias VirtualFree = STDWINAPI.VirtualFree;
	alias VirtualProtect = STDWINAPI.VirtualProtect;
	alias VirtualQuery = STDWINAPI.VirtualQuery;
	alias VirtualProtectEx = STDWINAPI.VirtualProtectEx;
	alias VirtualQueryEx = STDWINAPI.VirtualQueryEx;
	alias HeapCreate = STDWINAPI.HeapCreate;
	alias HeapDestroy = STDWINAPI.HeapDestroy;
	alias HeapAlloc = STDWINAPI.HeapAlloc;
	alias HeapReAlloc = STDWINAPI.HeapReAlloc;
	alias HeapFree = STDWINAPI.HeapFree;
	alias HeapSize = STDWINAPI.HeapSize;
	alias HeapValidate = STDWINAPI.HeapValidate;
	alias HeapCompact = STDWINAPI.HeapCompact;
	alias GetProcessHeap = STDWINAPI.GetProcessHeap;
	alias GetProcessHeaps = STDWINAPI.GetProcessHeaps;
	alias HeapLock = STDWINAPI.HeapLock;
	alias HeapUnlock = STDWINAPI.HeapUnlock;
	alias HeapWalk = STDWINAPI.HeapWalk;
	alias GetProcessAffinityMask = STDWINAPI.GetProcessAffinityMask;
	alias GetProcessTimes = STDWINAPI.GetProcessTimes;
	alias GetProcessWorkingSetSize = STDWINAPI.GetProcessWorkingSetSize;
	alias SetProcessWorkingSetSize = STDWINAPI.SetProcessWorkingSetSize;
	alias OpenProcess = STDWINAPI.OpenProcess;
	alias GetCurrentProcess = STDWINAPI.GetCurrentProcess;
	alias GetCurrentProcessId = STDWINAPI.GetCurrentProcessId;
	alias ExitProcess = STDWINAPI.ExitProcess;
	alias TerminateProcess = STDWINAPI.TerminateProcess;
	alias GetExitCodeProcess = STDWINAPI.GetExitCodeProcess;
	alias FatalExit = STDWINAPI.FatalExit;
	alias RaiseException = STDWINAPI.RaiseException;
	alias UnhandledExceptionFilter = STDWINAPI.UnhandledExceptionFilter;
	alias CreateRemoteThread = STDWINAPI.CreateRemoteThread;
	alias GetCurrentThread = STDWINAPI.GetCurrentThread;
	alias GetCurrentThreadId = STDWINAPI.GetCurrentThreadId;
	alias SetThreadAffinityMask = STDWINAPI.SetThreadAffinityMask;
	alias SetThreadPriority = STDWINAPI.SetThreadPriority;
	alias GetThreadPriority = STDWINAPI.GetThreadPriority;
	alias GetThreadTimes = STDWINAPI.GetThreadTimes;
	alias ExitThread = STDWINAPI.ExitThread;
	alias TerminateThread = STDWINAPI.TerminateThread;
	alias GetExitCodeThread = STDWINAPI.GetExitCodeThread;
	alias GetThreadSelectorEntry = STDWINAPI.GetThreadSelectorEntry;
	alias GetLastError = STDWINAPI.GetLastError;
	alias SetLastError = STDWINAPI.SetLastError;
	alias CreateIoCompletionPort = STDWINAPI.CreateIoCompletionPort;
	alias SetErrorMode = STDWINAPI.SetErrorMode;
	alias ReadProcessMemory = STDWINAPI.ReadProcessMemory;
	alias WriteProcessMemory = STDWINAPI.WriteProcessMemory;
	alias GetThreadContext = STDWINAPI.GetThreadContext;
	alias SuspendThread = STDWINAPI.SuspendThread;
	alias ResumeThread = STDWINAPI.ResumeThread;
	alias DebugBreak = STDWINAPI.DebugBreak;
	alias WaitForDebugEvent = STDWINAPI.WaitForDebugEvent;
	alias ContinueDebugEvent = STDWINAPI.ContinueDebugEvent;
	alias DebugActiveProcess = STDWINAPI.DebugActiveProcess;
	alias InitializeCriticalSection = STDWINAPI.InitializeCriticalSection;
	alias EnterCriticalSection = STDWINAPI.EnterCriticalSection;
	alias TryEnterCriticalSection = STDWINAPI.TryEnterCriticalSection;
	alias LeaveCriticalSection = STDWINAPI.LeaveCriticalSection;
	alias DeleteCriticalSection = STDWINAPI.DeleteCriticalSection;
	alias SetEvent = STDWINAPI.SetEvent;
	alias ResetEvent = STDWINAPI.ResetEvent;
	alias PulseEvent = STDWINAPI.PulseEvent;
	alias ReleaseSemaphore = STDWINAPI.ReleaseSemaphore;
	alias ReleaseMutex = STDWINAPI.ReleaseMutex;
	alias WaitForSingleObject = STDWINAPI.WaitForSingleObject;
	alias WaitForMultipleObjects = STDWINAPI.WaitForMultipleObjects;
	alias Sleep = STDWINAPI.Sleep;
	alias LoadResource = STDWINAPI.LoadResource;
	alias SizeofResource = STDWINAPI.SizeofResource;
	alias GlobalDeleteAtom = STDWINAPI.GlobalDeleteAtom;
	alias InitAtomTable = STDWINAPI.InitAtomTable;
	alias DeleteAtom = STDWINAPI.DeleteAtom;
	alias SetHandleCount = STDWINAPI.SetHandleCount;
	alias GetLogicalDrives = STDWINAPI.GetLogicalDrives;
	alias LockFile = STDWINAPI.LockFile;
	alias UnlockFile = STDWINAPI.UnlockFile;
	alias LockFileEx = STDWINAPI.LockFileEx;
	alias UnlockFileEx = STDWINAPI.UnlockFileEx;
	alias GetFileInformationByHandle = STDWINAPI.GetFileInformationByHandle;
	alias GetFileType = STDWINAPI.GetFileType;
	alias GetFileSize = STDWINAPI.GetFileSize;
	alias GetStdHandle = STDWINAPI.GetStdHandle;
	alias SetStdHandle = STDWINAPI.SetStdHandle;
	alias FlushFileBuffers = STDWINAPI.FlushFileBuffers;
	alias DeviceIoControl = STDWINAPI.DeviceIoControl;
	alias SetEndOfFile = STDWINAPI.SetEndOfFile;
	alias SetFilePointer = STDWINAPI.SetFilePointer;
	alias FindClose = STDWINAPI.FindClose;
	alias GetFileTime = STDWINAPI.GetFileTime;
	alias SetFileTime = STDWINAPI.SetFileTime;
	alias CloseHandle = STDWINAPI.CloseHandle;
	alias DuplicateHandle = STDWINAPI.DuplicateHandle;
	alias GetHandleInformation = STDWINAPI.GetHandleInformation;
	alias SetHandleInformation = STDWINAPI.SetHandleInformation;
	alias LoadModule = STDWINAPI.LoadModule;
	alias WinExec = STDWINAPI.WinExec;
	alias ClearCommBreak = STDWINAPI.ClearCommBreak;
	alias ClearCommError = STDWINAPI.ClearCommError;
	alias SetupComm = STDWINAPI.SetupComm;
	alias EscapeCommFunction = STDWINAPI.EscapeCommFunction;
	alias GetCommConfig = STDWINAPI.GetCommConfig;
	alias GetCommProperties = STDWINAPI.GetCommProperties;
	alias GetCommModemStatus = STDWINAPI.GetCommModemStatus;
	alias GetCommState = STDWINAPI.GetCommState;
	alias GetCommTimeouts = STDWINAPI.GetCommTimeouts;
	alias PurgeComm = STDWINAPI.PurgeComm;
	alias SetCommBreak = STDWINAPI.SetCommBreak;
	alias SetCommConfig = STDWINAPI.SetCommConfig;
	alias SetCommMask = STDWINAPI.SetCommMask;
	alias SetCommState = STDWINAPI.SetCommState;
	alias SetCommTimeouts = STDWINAPI.SetCommTimeouts;
	alias TransmitCommChar = STDWINAPI.TransmitCommChar;
	alias WaitCommEvent = STDWINAPI.WaitCommEvent;
	alias SetTapePosition = STDWINAPI.SetTapePosition;
	alias GetTapePosition = STDWINAPI.GetTapePosition;
	alias PrepareTape = STDWINAPI.PrepareTape;
	alias EraseTape = STDWINAPI.EraseTape;
	alias CreateTapePartition = STDWINAPI.CreateTapePartition;
	alias WriteTapemark = STDWINAPI.WriteTapemark;
	alias GetTapeStatus = STDWINAPI.GetTapeStatus;
	alias GetTapeParameters = STDWINAPI.GetTapeParameters;
	alias SetTapeParameters = STDWINAPI.SetTapeParameters;
	alias Beep = STDWINAPI.Beep;
	alias MulDiv = STDWINAPI.MulDiv;
	alias GetSystemTime = STDWINAPI.GetSystemTime;
	alias GetSystemTimeAsFileTime = STDWINAPI.GetSystemTimeAsFileTime;
	alias SetSystemTime = STDWINAPI.SetSystemTime;
	alias GetLocalTime = STDWINAPI.GetLocalTime;
	alias SetLocalTime = STDWINAPI.SetLocalTime;
	alias GetSystemInfo = STDWINAPI.GetSystemInfo;
	alias SystemTimeToTzSpecificLocalTime = STDWINAPI.SystemTimeToTzSpecificLocalTime;
	alias GetTimeZoneInformation = STDWINAPI.GetTimeZoneInformation;
	alias SetTimeZoneInformation = STDWINAPI.SetTimeZoneInformation;
	alias SystemTimeToFileTime = STDWINAPI.SystemTimeToFileTime;
	alias FileTimeToLocalFileTime = STDWINAPI.FileTimeToLocalFileTime;
	alias LocalFileTimeToFileTime = STDWINAPI.LocalFileTimeToFileTime;
	alias FileTimeToSystemTime = STDWINAPI.FileTimeToSystemTime;
	alias CompareFileTime = STDWINAPI.CompareFileTime;
	alias FileTimeToDosDateTime = STDWINAPI.FileTimeToDosDateTime;
	alias DosDateTimeToFileTime = STDWINAPI.DosDateTimeToFileTime;
	alias GetTickCount = STDWINAPI.GetTickCount;
	alias SetSystemTimeAdjustment = STDWINAPI.SetSystemTimeAdjustment;
	alias GetSystemTimeAdjustment = STDWINAPI.GetSystemTimeAdjustment;
	alias CreatePipe = STDWINAPI.CreatePipe;
	alias ConnectNamedPipe = STDWINAPI.ConnectNamedPipe;
	alias DisconnectNamedPipe = STDWINAPI.DisconnectNamedPipe;
	alias SetNamedPipeHandleState = STDWINAPI.SetNamedPipeHandleState;
	alias GetNamedPipeInfo = STDWINAPI.GetNamedPipeInfo;
	alias PeekNamedPipe = STDWINAPI.PeekNamedPipe;
	alias TransactNamedPipe = STDWINAPI.TransactNamedPipe;
	alias GetMailslotInfo = STDWINAPI.GetMailslotInfo;
	alias SetMailslotInfo = STDWINAPI.SetMailslotInfo;
	alias MapViewOfFile = STDWINAPI.MapViewOfFile;
	alias FlushViewOfFile = STDWINAPI.FlushViewOfFile;
	alias UnmapViewOfFile = STDWINAPI.UnmapViewOfFile;
	alias OpenFile = STDWINAPI.OpenFile;
	alias _lopen = STDWINAPI._lopen;
	alias _lcreat = STDWINAPI._lcreat;
	alias _lread = STDWINAPI._lread;
	alias _lwrite = STDWINAPI._lwrite;
	alias _hread = STDWINAPI._hread;
	alias _hwrite = STDWINAPI._hwrite;
	alias _lclose = STDWINAPI._lclose;
	alias _llseek = STDWINAPI._llseek;
	alias IsTextUnicode = STDWINAPI.IsTextUnicode;
	alias TlsAlloc = STDWINAPI.TlsAlloc;
	alias TlsGetValue = STDWINAPI.TlsGetValue;
	alias TlsSetValue = STDWINAPI.TlsSetValue;
	alias TlsFree = STDWINAPI.TlsFree;
	alias SleepEx = STDWINAPI.SleepEx;
	alias WaitForSingleObjectEx = STDWINAPI.WaitForSingleObjectEx;
	alias WaitForMultipleObjectsEx = STDWINAPI.WaitForMultipleObjectsEx;
	alias ReadFileEx = STDWINAPI.ReadFileEx;
	alias WriteFileEx = STDWINAPI.WriteFileEx;
	alias BackupRead = STDWINAPI.BackupRead;
	alias BackupSeek = STDWINAPI.BackupSeek;
	alias BackupWrite = STDWINAPI.BackupWrite;
	alias SetProcessShutdownParameters = STDWINAPI.SetProcessShutdownParameters;
	alias GetProcessShutdownParameters = STDWINAPI.GetProcessShutdownParameters;
	alias SetFileApisToOEM = STDWINAPI.SetFileApisToOEM;
	alias SetFileApisToANSI = STDWINAPI.SetFileApisToANSI;
	alias AreFileApisANSI = STDWINAPI.AreFileApisANSI;
	alias CloseEventLog = STDWINAPI.CloseEventLog;
	alias DeregisterEventSource = STDWINAPI.DeregisterEventSource;
	alias NotifyChangeEventLog = STDWINAPI.NotifyChangeEventLog;
	alias GetNumberOfEventLogRecords = STDWINAPI.GetNumberOfEventLogRecords;
	alias GetOldestEventLogRecord = STDWINAPI.GetOldestEventLogRecord;
	alias DuplicateToken = STDWINAPI.DuplicateToken;
	alias GetKernelObjectSecurity = STDWINAPI.GetKernelObjectSecurity;
	alias ImpersonateNamedPipeClient = STDWINAPI.ImpersonateNamedPipeClient;
	alias ImpersonateLoggedOnUser = STDWINAPI.ImpersonateLoggedOnUser;
	alias ImpersonateSelf = STDWINAPI.ImpersonateSelf;
	alias RevertToSelf = STDWINAPI.RevertToSelf;
	alias SetThreadToken = STDWINAPI.SetThreadToken;
	alias OpenProcessToken = STDWINAPI.OpenProcessToken;
	alias OpenThreadToken = STDWINAPI.OpenThreadToken;
	alias GetTokenInformation = STDWINAPI.GetTokenInformation;
	alias SetTokenInformation = STDWINAPI.SetTokenInformation;
	alias AdjustTokenPrivileges = STDWINAPI.AdjustTokenPrivileges;
	alias AdjustTokenGroups = STDWINAPI.AdjustTokenGroups;
	alias PrivilegeCheck = STDWINAPI.PrivilegeCheck;
	alias IsValidSid = STDWINAPI.IsValidSid;
	alias EqualSid = STDWINAPI.EqualSid;
	alias EqualPrefixSid = STDWINAPI.EqualPrefixSid;
	alias GetSidLengthRequired = STDWINAPI.GetSidLengthRequired;
	alias AllocateAndInitializeSid = STDWINAPI.AllocateAndInitializeSid;
	alias FreeSid = STDWINAPI.FreeSid;
	alias InitializeSid = STDWINAPI.InitializeSid;
	alias GetSidIdentifierAuthority = STDWINAPI.GetSidIdentifierAuthority;
	alias GetSidSubAuthority = STDWINAPI.GetSidSubAuthority;
	alias GetSidSubAuthorityCount = STDWINAPI.GetSidSubAuthorityCount;
	alias GetLengthSid = STDWINAPI.GetLengthSid;
	alias CopySid = STDWINAPI.CopySid;
	alias AreAllAccessesGranted = STDWINAPI.AreAllAccessesGranted;
	alias AreAnyAccessesGranted = STDWINAPI.AreAnyAccessesGranted;
	alias MapGenericMask = STDWINAPI.MapGenericMask;
	alias IsValidAcl = STDWINAPI.IsValidAcl;
	alias InitializeAcl = STDWINAPI.InitializeAcl;
	alias GetAclInformation = STDWINAPI.GetAclInformation;
	alias SetAclInformation = STDWINAPI.SetAclInformation;
	alias AddAce = STDWINAPI.AddAce;
	alias DeleteAce = STDWINAPI.DeleteAce;
	alias GetAce = STDWINAPI.GetAce;
	alias AddAccessAllowedAce = STDWINAPI.AddAccessAllowedAce;
	alias AddAccessDeniedAce = STDWINAPI.AddAccessDeniedAce;
	alias AddAuditAccessAce = STDWINAPI.AddAuditAccessAce;
	alias FindFirstFreeAce = STDWINAPI.FindFirstFreeAce;
	alias InitializeSecurityDescriptor = STDWINAPI.InitializeSecurityDescriptor;
	alias IsValidSecurityDescriptor = STDWINAPI.IsValidSecurityDescriptor;
	alias GetSecurityDescriptorLength = STDWINAPI.GetSecurityDescriptorLength;
	alias GetSecurityDescriptorControl = STDWINAPI.GetSecurityDescriptorControl;
	alias SetSecurityDescriptorDacl = STDWINAPI.SetSecurityDescriptorDacl;
	alias GetSecurityDescriptorDacl = STDWINAPI.GetSecurityDescriptorDacl;
	alias SetSecurityDescriptorSacl = STDWINAPI.SetSecurityDescriptorSacl;
	alias GetSecurityDescriptorSacl = STDWINAPI.GetSecurityDescriptorSacl;
	alias SetSecurityDescriptorOwner = STDWINAPI.SetSecurityDescriptorOwner;
	alias GetSecurityDescriptorOwner = STDWINAPI.GetSecurityDescriptorOwner;
	alias SetSecurityDescriptorGroup = STDWINAPI.SetSecurityDescriptorGroup;
	alias GetSecurityDescriptorGroup = STDWINAPI.GetSecurityDescriptorGroup;
	alias CreatePrivateObjectSecurity = STDWINAPI.CreatePrivateObjectSecurity;
	alias SetPrivateObjectSecurity = STDWINAPI.SetPrivateObjectSecurity;
	alias GetPrivateObjectSecurity = STDWINAPI.GetPrivateObjectSecurity;
	alias DestroyPrivateObjectSecurity = STDWINAPI.DestroyPrivateObjectSecurity;
	alias MakeSelfRelativeSD = STDWINAPI.MakeSelfRelativeSD;
	alias MakeAbsoluteSD = STDWINAPI.MakeAbsoluteSD;
	alias SetKernelObjectSecurity = STDWINAPI.SetKernelObjectSecurity;
	alias FindNextChangeNotification = STDWINAPI.FindNextChangeNotification;
	alias FindCloseChangeNotification = STDWINAPI.FindCloseChangeNotification;
	alias VirtualLock = STDWINAPI.VirtualLock;
	alias VirtualUnlock = STDWINAPI.VirtualUnlock;
	alias MapViewOfFileEx = STDWINAPI.MapViewOfFileEx;
	alias SetPriorityClass = STDWINAPI.SetPriorityClass;
	alias GetPriorityClass = STDWINAPI.GetPriorityClass;
	alias IsBadReadPtr = STDWINAPI.IsBadReadPtr;
	alias IsBadWritePtr = STDWINAPI.IsBadWritePtr;
	alias IsBadHugeReadPtr = STDWINAPI.IsBadHugeReadPtr;
	alias IsBadHugeWritePtr = STDWINAPI.IsBadHugeWritePtr;
	alias IsBadCodePtr = STDWINAPI.IsBadCodePtr;
	alias AllocateLocallyUniqueId = STDWINAPI.AllocateLocallyUniqueId;
	alias QueryPerformanceCounter = STDWINAPI.QueryPerformanceCounter;
	alias QueryPerformanceFrequency = STDWINAPI.QueryPerformanceFrequency;
	alias ActivateKeyboardLayout = STDWINAPI.ActivateKeyboardLayout;
	alias UnloadKeyboardLayout = STDWINAPI.UnloadKeyboardLayout;
	alias GetKeyboardLayoutList = STDWINAPI.GetKeyboardLayoutList;
	alias GetKeyboardLayout = STDWINAPI.GetKeyboardLayout;
	alias OpenInputDesktop = STDWINAPI.OpenInputDesktop;
	alias EnumDesktopWindows = STDWINAPI.EnumDesktopWindows;
	alias SwitchDesktop = STDWINAPI.SwitchDesktop;
	alias SetThreadDesktop = STDWINAPI.SetThreadDesktop;
	alias CloseDesktop = STDWINAPI.CloseDesktop;
	alias GetThreadDesktop = STDWINAPI.GetThreadDesktop;
	alias CloseWindowStation = STDWINAPI.CloseWindowStation;
	alias SetProcessWindowStation = STDWINAPI.SetProcessWindowStation;
	alias GetProcessWindowStation = STDWINAPI.GetProcessWindowStation;
	alias SetUserObjectSecurity = STDWINAPI.SetUserObjectSecurity;
	alias GetUserObjectSecurity = STDWINAPI.GetUserObjectSecurity;
	alias TranslateMessage = STDWINAPI.TranslateMessage;
	alias SetMessageQueue = STDWINAPI.SetMessageQueue;
	alias RegisterHotKey = STDWINAPI.RegisterHotKey;
	alias UnregisterHotKey = STDWINAPI.UnregisterHotKey;
	alias ExitWindowsEx = STDWINAPI.ExitWindowsEx;
	alias SwapMouseButton = STDWINAPI.SwapMouseButton;
	alias GetMessagePos = STDWINAPI.GetMessagePos;
	alias GetMessageTime = STDWINAPI.GetMessageTime;
	alias GetMessageExtraInfo = STDWINAPI.GetMessageExtraInfo;
	alias SetMessageExtraInfo = STDWINAPI.SetMessageExtraInfo;
	alias BroadcastSystemMessage = STDWINAPI.BroadcastSystemMessage;
	alias AttachThreadInput = STDWINAPI.AttachThreadInput;
	alias ReplyMessage = STDWINAPI.ReplyMessage;
	alias WaitMessage = STDWINAPI.WaitMessage;
	alias WaitForInputIdle = STDWINAPI.WaitForInputIdle;
	alias PostQuitMessage = STDWINAPI.PostQuitMessage;
	alias InSendMessage = STDWINAPI.InSendMessage;
	alias GetDoubleClickTime = STDWINAPI.GetDoubleClickTime;
	alias SetDoubleClickTime = STDWINAPI.SetDoubleClickTime;
	alias IsWindow = STDWINAPI.IsWindow;
	alias IsMenu = STDWINAPI.IsMenu;
	alias IsChild = STDWINAPI.IsChild;
	alias DestroyWindow = STDWINAPI.DestroyWindow;
	alias ShowWindow = STDWINAPI.ShowWindow;
	alias ShowWindowAsync = STDWINAPI.ShowWindowAsync;
	alias FlashWindow = STDWINAPI.FlashWindow;
	alias ShowOwnedPopups = STDWINAPI.ShowOwnedPopups;
	alias OpenIcon = STDWINAPI.OpenIcon;
	alias CloseWindow = STDWINAPI.CloseWindow;
	alias MoveWindow = STDWINAPI.MoveWindow;
	alias SetWindowPos = STDWINAPI.SetWindowPos;
	alias GetWindowPlacement = STDWINAPI.GetWindowPlacement;
	alias SetWindowPlacement = STDWINAPI.SetWindowPlacement;
	alias BeginDeferWindowPos = STDWINAPI.BeginDeferWindowPos;
	alias DeferWindowPos = STDWINAPI.DeferWindowPos;
	alias EndDeferWindowPos = STDWINAPI.EndDeferWindowPos;
	alias IsWindowVisible = STDWINAPI.IsWindowVisible;
	alias IsIconic = STDWINAPI.IsIconic;
	alias AnyPopup = STDWINAPI.AnyPopup;
	alias BringWindowToTop = STDWINAPI.BringWindowToTop;
	alias IsZoomed = STDWINAPI.IsZoomed;
	alias EndDialog = STDWINAPI.EndDialog;
	alias GetDlgItem = STDWINAPI.GetDlgItem;
	alias SetDlgItemInt = STDWINAPI.SetDlgItemInt;
	alias GetDlgItemInt = STDWINAPI.GetDlgItemInt;
	alias CheckDlgButton = STDWINAPI.CheckDlgButton;
	alias CheckRadioButton = STDWINAPI.CheckRadioButton;
	alias IsDlgButtonChecked = STDWINAPI.IsDlgButtonChecked;
	alias GetNextDlgGroupItem = STDWINAPI.GetNextDlgGroupItem;
	alias GetNextDlgTabItem = STDWINAPI.GetNextDlgTabItem;
	alias GetDlgCtrlID = STDWINAPI.GetDlgCtrlID;
	alias GetDialogBaseUnits = STDWINAPI.GetDialogBaseUnits;
	alias OpenClipboard = STDWINAPI.OpenClipboard;
	alias CloseClipboard = STDWINAPI.CloseClipboard;
	alias GetClipboardOwner = STDWINAPI.GetClipboardOwner;
	alias SetClipboardViewer = STDWINAPI.SetClipboardViewer;
	alias GetClipboardViewer = STDWINAPI.GetClipboardViewer;
	alias ChangeClipboardChain = STDWINAPI.ChangeClipboardChain;
	alias SetClipboardData = STDWINAPI.SetClipboardData;
	alias GetClipboardData = STDWINAPI.GetClipboardData;
	alias CountClipboardFormats = STDWINAPI.CountClipboardFormats;
	alias EnumClipboardFormats = STDWINAPI.EnumClipboardFormats;
	alias EmptyClipboard = STDWINAPI.EmptyClipboard;
	alias IsClipboardFormatAvailable = STDWINAPI.IsClipboardFormatAvailable;
	alias GetPriorityClipboardFormat = STDWINAPI.GetPriorityClipboardFormat;
	alias GetOpenClipboardWindow = STDWINAPI.GetOpenClipboardWindow;
	alias CharNextExA = STDWINAPI.CharNextExA;
	alias CharPrevExA = STDWINAPI.CharPrevExA;
	alias SetFocus = STDWINAPI.SetFocus;
	alias GetActiveWindow = STDWINAPI.GetActiveWindow;
	alias GetFocus = STDWINAPI.GetFocus;
	alias GetKBCodePage = STDWINAPI.GetKBCodePage;
	alias GetKeyState = STDWINAPI.GetKeyState;
	alias GetAsyncKeyState = STDWINAPI.GetAsyncKeyState;
	alias GetKeyboardState = STDWINAPI.GetKeyboardState;
	alias SetKeyboardState = STDWINAPI.SetKeyboardState;
	alias GetKeyboardType = STDWINAPI.GetKeyboardType;
	alias ToAscii = STDWINAPI.ToAscii;
	alias ToAsciiEx = STDWINAPI.ToAsciiEx;
	alias ToUnicode = STDWINAPI.ToUnicode;
	alias OemKeyScan = STDWINAPI.OemKeyScan;
	alias keybd_event = STDWINAPI.keybd_event;
	alias mouse_event = STDWINAPI.mouse_event;
	alias GetInputState = STDWINAPI.GetInputState;
	alias GetQueueStatus = STDWINAPI.GetQueueStatus;
	alias GetCapture = STDWINAPI.GetCapture;
	alias SetCapture = STDWINAPI.SetCapture;
	alias ReleaseCapture = STDWINAPI.ReleaseCapture;
	alias MsgWaitForMultipleObjects = STDWINAPI.MsgWaitForMultipleObjects;
	alias SetTimer = STDWINAPI.SetTimer;
	alias KillTimer = STDWINAPI.KillTimer;
	alias IsWindowUnicode = STDWINAPI.IsWindowUnicode;
	alias EnableWindow = STDWINAPI.EnableWindow;
	alias IsWindowEnabled = STDWINAPI.IsWindowEnabled;
	alias DestroyAcceleratorTable = STDWINAPI.DestroyAcceleratorTable;
	alias GetSystemMetrics = STDWINAPI.GetSystemMetrics;
	alias GetMenu = STDWINAPI.GetMenu;
	alias SetMenu = STDWINAPI.SetMenu;
	alias HiliteMenuItem = STDWINAPI.HiliteMenuItem;
	alias GetMenuState = STDWINAPI.GetMenuState;
	alias DrawMenuBar = STDWINAPI.DrawMenuBar;
	alias GetSystemMenu = STDWINAPI.GetSystemMenu;
	alias CreateMenu = STDWINAPI.CreateMenu;
	alias CreatePopupMenu = STDWINAPI.CreatePopupMenu;
	alias DestroyMenu = STDWINAPI.DestroyMenu;
	alias CheckMenuItem = STDWINAPI.CheckMenuItem;
	alias EnableMenuItem = STDWINAPI.EnableMenuItem;
	alias GetSubMenu = STDWINAPI.GetSubMenu;
	alias GetMenuItemID = STDWINAPI.GetMenuItemID;
	alias GetMenuItemCount = STDWINAPI.GetMenuItemCount;
	alias RemoveMenu = STDWINAPI.RemoveMenu;
	alias DeleteMenu = STDWINAPI.DeleteMenu;
	alias SetMenuItemBitmaps = STDWINAPI.SetMenuItemBitmaps;
	alias GetMenuCheckMarkDimensions = STDWINAPI.GetMenuCheckMarkDimensions;
	alias TrackPopupMenu = STDWINAPI.TrackPopupMenu;
	alias GetMenuDefaultItem = STDWINAPI.GetMenuDefaultItem;
	alias SetMenuDefaultItem = STDWINAPI.SetMenuDefaultItem;
	alias GetMenuItemRect = STDWINAPI.GetMenuItemRect;
	alias MenuItemFromPoint = STDWINAPI.MenuItemFromPoint;
	alias DragObject = STDWINAPI.DragObject;
	alias DragDetect = STDWINAPI.DragDetect;
	alias DrawIcon = STDWINAPI.DrawIcon;
	alias UpdateWindow = STDWINAPI.UpdateWindow;
	alias SetActiveWindow = STDWINAPI.SetActiveWindow;
	alias GetForegroundWindow = STDWINAPI.GetForegroundWindow;
	alias PaintDesktop = STDWINAPI.PaintDesktop;
	alias SetForegroundWindow = STDWINAPI.SetForegroundWindow;
	alias WindowFromDC = STDWINAPI.WindowFromDC;
	alias GetDC = STDWINAPI.GetDC;
	alias GetDCEx = STDWINAPI.GetDCEx;
	alias GetWindowDC = STDWINAPI.GetWindowDC;
	alias ReleaseDC = STDWINAPI.ReleaseDC;
	alias BeginPaint = STDWINAPI.BeginPaint;
	alias EndPaint = STDWINAPI.EndPaint;
	alias GetUpdateRect = STDWINAPI.GetUpdateRect;
	alias GetUpdateRgn = STDWINAPI.GetUpdateRgn;
	alias SetWindowRgn = STDWINAPI.SetWindowRgn;
	alias GetWindowRgn = STDWINAPI.GetWindowRgn;
	alias ExcludeUpdateRgn = STDWINAPI.ExcludeUpdateRgn;
	alias InvalidateRect = STDWINAPI.InvalidateRect;
	alias ValidateRect = STDWINAPI.ValidateRect;
	alias InvalidateRgn = STDWINAPI.InvalidateRgn;
	alias ValidateRgn = STDWINAPI.ValidateRgn;
	alias RedrawWindow = STDWINAPI.RedrawWindow;
	alias LockWindowUpdate = STDWINAPI.LockWindowUpdate;
	alias ScrollWindow = STDWINAPI.ScrollWindow;
	alias ScrollDC = STDWINAPI.ScrollDC;
	alias ScrollWindowEx = STDWINAPI.ScrollWindowEx;
	alias SetScrollPos = STDWINAPI.SetScrollPos;
	alias GetScrollPos = STDWINAPI.GetScrollPos;
	alias SetScrollRange = STDWINAPI.SetScrollRange;
	alias GetScrollRange = STDWINAPI.GetScrollRange;
	alias ShowScrollBar = STDWINAPI.ShowScrollBar;
	alias EnableScrollBar = STDWINAPI.EnableScrollBar;
	alias GetClientRect = STDWINAPI.GetClientRect;
	alias GetWindowRect = STDWINAPI.GetWindowRect;
	alias AdjustWindowRect = STDWINAPI.AdjustWindowRect;
	alias AdjustWindowRectEx = STDWINAPI.AdjustWindowRectEx;
	alias SetWindowContextHelpId = STDWINAPI.SetWindowContextHelpId;
	alias GetWindowContextHelpId = STDWINAPI.GetWindowContextHelpId;
	alias SetMenuContextHelpId = STDWINAPI.SetMenuContextHelpId;
	alias GetMenuContextHelpId = STDWINAPI.GetMenuContextHelpId;
	alias MessageBeep = STDWINAPI.MessageBeep;
	alias ShowCursor = STDWINAPI.ShowCursor;
	alias SetCursorPos = STDWINAPI.SetCursorPos;
	alias SetCursor = STDWINAPI.SetCursor;
	alias GetCursorPos = STDWINAPI.GetCursorPos;
	alias ClipCursor = STDWINAPI.ClipCursor;
	alias GetClipCursor = STDWINAPI.GetClipCursor;
	alias GetCursor = STDWINAPI.GetCursor;
	alias CreateCaret = STDWINAPI.CreateCaret;
	alias GetCaretBlinkTime = STDWINAPI.GetCaretBlinkTime;
	alias SetCaretBlinkTime = STDWINAPI.SetCaretBlinkTime;
	alias DestroyCaret = STDWINAPI.DestroyCaret;
	alias HideCaret = STDWINAPI.HideCaret;
	alias ShowCaret = STDWINAPI.ShowCaret;
	alias SetCaretPos = STDWINAPI.SetCaretPos;
	alias GetCaretPos = STDWINAPI.GetCaretPos;
	alias ClientToScreen = STDWINAPI.ClientToScreen;
	alias ScreenToClient = STDWINAPI.ScreenToClient;
	alias MapWindowPoints = STDWINAPI.MapWindowPoints;
	alias WindowFromPoint = STDWINAPI.WindowFromPoint;
	alias ChildWindowFromPoint = STDWINAPI.ChildWindowFromPoint;
	alias GetSysColor = STDWINAPI.GetSysColor;
	alias GetSysColorBrush = STDWINAPI.GetSysColorBrush;
	alias SetSysColors = STDWINAPI.SetSysColors;
	alias DrawFocusRect = STDWINAPI.DrawFocusRect;
	alias FillRect = STDWINAPI.FillRect;
	alias FrameRect = STDWINAPI.FrameRect;
	alias InvertRect = STDWINAPI.InvertRect;
	alias SetRect = STDWINAPI.SetRect;
	alias SetRectEmpty = STDWINAPI.SetRectEmpty;
	alias CopyRect = STDWINAPI.CopyRect;
	alias InflateRect = STDWINAPI.InflateRect;
	alias IntersectRect = STDWINAPI.IntersectRect;
	alias UnionRect = STDWINAPI.UnionRect;
	alias SubtractRect = STDWINAPI.SubtractRect;
	alias OffsetRect = STDWINAPI.OffsetRect;
	alias IsRectEmpty = STDWINAPI.IsRectEmpty;
	alias EqualRect = STDWINAPI.EqualRect;
	alias PtInRect = STDWINAPI.PtInRect;
	alias GetWindowWord = STDWINAPI.GetWindowWord;
	alias SetWindowWord = STDWINAPI.SetWindowWord;
	alias GetClassWord = STDWINAPI.GetClassWord;
	alias SetClassWord = STDWINAPI.SetClassWord;
	alias GetDesktopWindow = STDWINAPI.GetDesktopWindow;
	alias GetParent = STDWINAPI.GetParent;
	alias SetParent = STDWINAPI.SetParent;
	alias EnumChildWindows = STDWINAPI.EnumChildWindows;
	alias EnumWindows = STDWINAPI.EnumWindows;
	alias EnumThreadWindows = STDWINAPI.EnumThreadWindows;
	alias GetTopWindow = STDWINAPI.GetTopWindow;
	alias GetWindowThreadProcessId = STDWINAPI.GetWindowThreadProcessId;
	alias GetLastActivePopup = STDWINAPI.GetLastActivePopup;
	alias GetWindow = STDWINAPI.GetWindow;
	alias UnhookWindowsHook = STDWINAPI.UnhookWindowsHook;
	alias UnhookWindowsHookEx = STDWINAPI.UnhookWindowsHookEx;
	alias CallNextHookEx = STDWINAPI.CallNextHookEx;
	alias CheckMenuRadioItem = STDWINAPI.CheckMenuRadioItem;
	alias CreateCursor = STDWINAPI.CreateCursor;
	alias DestroyCursor = STDWINAPI.DestroyCursor;
	alias SetSystemCursor = STDWINAPI.SetSystemCursor;
	alias CreateIcon = STDWINAPI.CreateIcon;
	alias DestroyIcon = STDWINAPI.DestroyIcon;
	alias LookupIconIdFromDirectory = STDWINAPI.LookupIconIdFromDirectory;
	alias LookupIconIdFromDirectoryEx = STDWINAPI.LookupIconIdFromDirectoryEx;
	alias CreateIconFromResource = STDWINAPI.CreateIconFromResource;
	alias CreateIconFromResourceEx = STDWINAPI.CreateIconFromResourceEx;
	alias CopyImage = STDWINAPI.CopyImage;
	alias CreateIconIndirect = STDWINAPI.CreateIconIndirect;
	alias CopyIcon = STDWINAPI.CopyIcon;
	alias GetIconInfo = STDWINAPI.GetIconInfo;
	alias MapDialogRect = STDWINAPI.MapDialogRect;
	alias SetScrollInfo = STDWINAPI.SetScrollInfo;
	alias GetScrollInfo = STDWINAPI.GetScrollInfo;
	alias TranslateMDISysAccel = STDWINAPI.TranslateMDISysAccel;
	alias ArrangeIconicWindows = STDWINAPI.ArrangeIconicWindows;
	alias TileWindows = STDWINAPI.TileWindows;
	alias CascadeWindows = STDWINAPI.CascadeWindows;
	alias SetLastErrorEx = STDWINAPI.SetLastErrorEx;
	alias SetDebugErrorLevel = STDWINAPI.SetDebugErrorLevel;
	alias DrawEdge = STDWINAPI.DrawEdge;
	alias DrawFrameControl = STDWINAPI.DrawFrameControl;
	alias DrawCaption = STDWINAPI.DrawCaption;
	alias DrawAnimatedRects = STDWINAPI.DrawAnimatedRects;
	alias TrackPopupMenuEx = STDWINAPI.TrackPopupMenuEx;
	alias ChildWindowFromPointEx = STDWINAPI.ChildWindowFromPointEx;
	alias DrawIconEx = STDWINAPI.DrawIconEx;
	alias AnimatePalette = STDWINAPI.AnimatePalette;
	alias Arc = STDWINAPI.Arc;
	alias BitBlt = STDWINAPI.BitBlt;
	alias CancelDC = STDWINAPI.CancelDC;
	alias Chord = STDWINAPI.Chord;
	alias CloseMetaFile = STDWINAPI.CloseMetaFile;
	alias CombineRgn = STDWINAPI.CombineRgn;
	alias CreateBitmap = STDWINAPI.CreateBitmap;
	alias CreateBitmapIndirect = STDWINAPI.CreateBitmapIndirect;
	alias CreateBrushIndirect = STDWINAPI.CreateBrushIndirect;
	alias CreateCompatibleBitmap = STDWINAPI.CreateCompatibleBitmap;
	alias CreateDiscardableBitmap = STDWINAPI.CreateDiscardableBitmap;
	alias CreateCompatibleDC = STDWINAPI.CreateCompatibleDC;
	alias CreateDIBitmap = STDWINAPI.CreateDIBitmap;
	alias CreateDIBPatternBrush = STDWINAPI.CreateDIBPatternBrush;
	alias CreateDIBPatternBrushPt = STDWINAPI.CreateDIBPatternBrushPt;
	alias CreateEllipticRgn = STDWINAPI.CreateEllipticRgn;
	alias CreateEllipticRgnIndirect = STDWINAPI.CreateEllipticRgnIndirect;
	alias CreateHatchBrush = STDWINAPI.CreateHatchBrush;
	alias CreatePalette = STDWINAPI.CreatePalette;
	alias CreatePen = STDWINAPI.CreatePen;
	alias CreatePenIndirect = STDWINAPI.CreatePenIndirect;
	alias CreatePolyPolygonRgn = STDWINAPI.CreatePolyPolygonRgn;
	alias CreatePatternBrush = STDWINAPI.CreatePatternBrush;
	alias CreateRectRgn = STDWINAPI.CreateRectRgn;
	alias CreateRectRgnIndirect = STDWINAPI.CreateRectRgnIndirect;
	alias CreateRoundRectRgn = STDWINAPI.CreateRoundRectRgn;
	alias CreateSolidBrush = STDWINAPI.CreateSolidBrush;
	alias DeleteDC = STDWINAPI.DeleteDC;
	alias DeleteMetaFile = STDWINAPI.DeleteMetaFile;
	alias DeleteObject = STDWINAPI.DeleteObject;
	alias DrawEscape = STDWINAPI.DrawEscape;
	alias Ellipse = STDWINAPI.Ellipse;
	alias EnumObjects = STDWINAPI.EnumObjects;
	alias EqualRgn = STDWINAPI.EqualRgn;
	alias Escape = STDWINAPI.Escape;
	alias ExtEscape = STDWINAPI.ExtEscape;
	alias ExcludeClipRect = STDWINAPI.ExcludeClipRect;
	alias ExtCreateRegion = STDWINAPI.ExtCreateRegion;
	alias ExtFloodFill = STDWINAPI.ExtFloodFill;
	alias FillRgn = STDWINAPI.FillRgn;
	alias FloodFill = STDWINAPI.FloodFill;
	alias FrameRgn = STDWINAPI.FrameRgn;
	alias GetROP2 = STDWINAPI.GetROP2;
	alias GetAspectRatioFilterEx = STDWINAPI.GetAspectRatioFilterEx;
	alias GetBkColor = STDWINAPI.GetBkColor;
	alias GetBkMode = STDWINAPI.GetBkMode;
	alias GetBitmapBits = STDWINAPI.GetBitmapBits;
	alias GetBitmapDimensionEx = STDWINAPI.GetBitmapDimensionEx;
	alias GetBoundsRect = STDWINAPI.GetBoundsRect;
	alias GetBrushOrgEx = STDWINAPI.GetBrushOrgEx;
	alias GetClipBox = STDWINAPI.GetClipBox;
	alias GetClipRgn = STDWINAPI.GetClipRgn;
	alias GetMetaRgn = STDWINAPI.GetMetaRgn;
	alias GetCurrentObject = STDWINAPI.GetCurrentObject;
	alias GetCurrentPositionEx = STDWINAPI.GetCurrentPositionEx;
	alias GetDeviceCaps = STDWINAPI.GetDeviceCaps;
	alias GetDIBits = STDWINAPI.GetDIBits;
	alias GetFontData = STDWINAPI.GetFontData;
	alias GetGraphicsMode = STDWINAPI.GetGraphicsMode;
	alias GetMapMode = STDWINAPI.GetMapMode;
	alias GetMetaFileBitsEx = STDWINAPI.GetMetaFileBitsEx;
	alias GetNearestColor = STDWINAPI.GetNearestColor;
	alias GetNearestPaletteIndex = STDWINAPI.GetNearestPaletteIndex;
	alias GetObjectType = STDWINAPI.GetObjectType;
	alias GetPaletteEntries = STDWINAPI.GetPaletteEntries;
	alias GetPixel = STDWINAPI.GetPixel;
	alias GetPixelFormat = STDWINAPI.GetPixelFormat;
	alias GetPolyFillMode = STDWINAPI.GetPolyFillMode;
	alias GetRasterizerCaps = STDWINAPI.GetRasterizerCaps;
	alias GetRegionData = STDWINAPI.GetRegionData;
	alias GetRgnBox = STDWINAPI.GetRgnBox;
	alias GetStockObject = STDWINAPI.GetStockObject;
	alias GetStretchBltMode = STDWINAPI.GetStretchBltMode;
	alias GetSystemPaletteEntries = STDWINAPI.GetSystemPaletteEntries;
	alias GetSystemPaletteUse = STDWINAPI.GetSystemPaletteUse;
	alias GetTextCharacterExtra = STDWINAPI.GetTextCharacterExtra;
	alias GetTextAlign = STDWINAPI.GetTextAlign;
	alias GetTextColor = STDWINAPI.GetTextColor;
	alias GetTextCharset = STDWINAPI.GetTextCharset;
	alias GetTextCharsetInfo = STDWINAPI.GetTextCharsetInfo;
	alias TranslateCharsetInfo = STDWINAPI.TranslateCharsetInfo;
	alias GetFontLanguageInfo = STDWINAPI.GetFontLanguageInfo;
	alias GetViewportExtEx = STDWINAPI.GetViewportExtEx;
	alias GetViewportOrgEx = STDWINAPI.GetViewportOrgEx;
	alias GetWindowExtEx = STDWINAPI.GetWindowExtEx;
	alias GetWindowOrgEx = STDWINAPI.GetWindowOrgEx;
	alias IntersectClipRect = STDWINAPI.IntersectClipRect;
	alias InvertRgn = STDWINAPI.InvertRgn;
	alias LineDDA = STDWINAPI.LineDDA;
	alias LineTo = STDWINAPI.LineTo;
	alias MaskBlt = STDWINAPI.MaskBlt;
	alias PlgBlt = STDWINAPI.PlgBlt;
	alias OffsetClipRgn = STDWINAPI.OffsetClipRgn;
	alias OffsetRgn = STDWINAPI.OffsetRgn;
	alias PatBlt = STDWINAPI.PatBlt;
	alias Pie = STDWINAPI.Pie;
	alias PlayMetaFile = STDWINAPI.PlayMetaFile;
	alias PaintRgn = STDWINAPI.PaintRgn;
	alias PolyPolygon = STDWINAPI.PolyPolygon;
	alias PtInRegion = STDWINAPI.PtInRegion;
	alias PtVisible = STDWINAPI.PtVisible;
	alias RectInRegion = STDWINAPI.RectInRegion;
	alias RectVisible = STDWINAPI.RectVisible;
	alias Rectangle = STDWINAPI.Rectangle;
	alias RestoreDC = STDWINAPI.RestoreDC;
	alias RealizePalette = STDWINAPI.RealizePalette;
	alias RoundRect = STDWINAPI.RoundRect;
	alias ResizePalette = STDWINAPI.ResizePalette;
	alias SaveDC = STDWINAPI.SaveDC;
	alias SelectClipRgn = STDWINAPI.SelectClipRgn;
	alias ExtSelectClipRgn = STDWINAPI.ExtSelectClipRgn;
	alias SetMetaRgn = STDWINAPI.SetMetaRgn;
	alias SelectObject = STDWINAPI.SelectObject;
	alias SelectPalette = STDWINAPI.SelectPalette;
	alias SetBkColor = STDWINAPI.SetBkColor;
	alias SetBkMode = STDWINAPI.SetBkMode;
	alias SetBitmapBits = STDWINAPI.SetBitmapBits;
	alias SetBoundsRect = STDWINAPI.SetBoundsRect;
	alias SetDIBits = STDWINAPI.SetDIBits;
	alias SetDIBitsToDevice = STDWINAPI.SetDIBitsToDevice;
	alias SetMapperFlags = STDWINAPI.SetMapperFlags;
	alias SetGraphicsMode = STDWINAPI.SetGraphicsMode;
	alias SetMapMode = STDWINAPI.SetMapMode;
	alias SetMetaFileBitsEx = STDWINAPI.SetMetaFileBitsEx;
	alias SetPaletteEntries = STDWINAPI.SetPaletteEntries;
	alias SetPixel = STDWINAPI.SetPixel;
	alias SetPixelV = STDWINAPI.SetPixelV;
	alias SetPolyFillMode = STDWINAPI.SetPolyFillMode;
	alias StretchBlt = STDWINAPI.StretchBlt;
	alias SetRectRgn = STDWINAPI.SetRectRgn;
	alias StretchDIBits = STDWINAPI.StretchDIBits;
	alias SetROP2 = STDWINAPI.SetROP2;
	alias SetStretchBltMode = STDWINAPI.SetStretchBltMode;
	alias SetSystemPaletteUse = STDWINAPI.SetSystemPaletteUse;
	alias SetTextCharacterExtra = STDWINAPI.SetTextCharacterExtra;
	alias SetTextColor = STDWINAPI.SetTextColor;
	alias SetTextAlign = STDWINAPI.SetTextAlign;
	alias SetTextJustification = STDWINAPI.SetTextJustification;
	alias UpdateColors = STDWINAPI.UpdateColors;
	alias PlayMetaFileRecord = STDWINAPI.PlayMetaFileRecord;
	alias EnumMetaFile = STDWINAPI.EnumMetaFile;
	alias CloseEnhMetaFile = STDWINAPI.CloseEnhMetaFile;
	alias DeleteEnhMetaFile = STDWINAPI.DeleteEnhMetaFile;
	alias EnumEnhMetaFile = STDWINAPI.EnumEnhMetaFile;
	alias GetEnhMetaFileHeader = STDWINAPI.GetEnhMetaFileHeader;
	alias GetEnhMetaFilePaletteEntries = STDWINAPI.GetEnhMetaFilePaletteEntries;
	alias GetWinMetaFileBits = STDWINAPI.GetWinMetaFileBits;
	alias PlayEnhMetaFile = STDWINAPI.PlayEnhMetaFile;
	alias PlayEnhMetaFileRecord = STDWINAPI.PlayEnhMetaFileRecord;
	alias SetEnhMetaFileBits = STDWINAPI.SetEnhMetaFileBits;
	alias SetWinMetaFileBits = STDWINAPI.SetWinMetaFileBits;
	alias GdiComment = STDWINAPI.GdiComment;
	alias AngleArc = STDWINAPI.AngleArc;
	alias PolyPolyline = STDWINAPI.PolyPolyline;
	alias GetWorldTransform = STDWINAPI.GetWorldTransform;
	alias SetWorldTransform = STDWINAPI.SetWorldTransform;
	alias ModifyWorldTransform = STDWINAPI.ModifyWorldTransform;
	alias CombineTransform = STDWINAPI.CombineTransform;
	alias CreateDIBSection = STDWINAPI.CreateDIBSection;
	alias GetDIBColorTable = STDWINAPI.GetDIBColorTable;
	alias SetDIBColorTable = STDWINAPI.SetDIBColorTable;
	alias SetColorAdjustment = STDWINAPI.SetColorAdjustment;
	alias GetColorAdjustment = STDWINAPI.GetColorAdjustment;
	alias CreateHalftonePalette = STDWINAPI.CreateHalftonePalette;
	alias EndDoc = STDWINAPI.EndDoc;
	alias StartPage = STDWINAPI.StartPage;
	alias EndPage = STDWINAPI.EndPage;
	alias AbortDoc = STDWINAPI.AbortDoc;
	alias SetAbortProc = STDWINAPI.SetAbortProc;
	alias ArcTo = STDWINAPI.ArcTo;
	alias BeginPath = STDWINAPI.BeginPath;
	alias CloseFigure = STDWINAPI.CloseFigure;
	alias EndPath = STDWINAPI.EndPath;
	alias FillPath = STDWINAPI.FillPath;
	alias FlattenPath = STDWINAPI.FlattenPath;
	alias GetPath = STDWINAPI.GetPath;
	alias PathToRegion = STDWINAPI.PathToRegion;
	alias PolyDraw = STDWINAPI.PolyDraw;
	alias SelectClipPath = STDWINAPI.SelectClipPath;
	alias SetArcDirection = STDWINAPI.SetArcDirection;
	alias SetMiterLimit = STDWINAPI.SetMiterLimit;
	alias StrokeAndFillPath = STDWINAPI.StrokeAndFillPath;
	alias StrokePath = STDWINAPI.StrokePath;
	alias WidenPath = STDWINAPI.WidenPath;
	alias ExtCreatePen = STDWINAPI.ExtCreatePen;
	alias GetMiterLimit = STDWINAPI.GetMiterLimit;
	alias GetArcDirection = STDWINAPI.GetArcDirection;
	alias MoveToEx = STDWINAPI.MoveToEx;
	alias CreatePolygonRgn = STDWINAPI.CreatePolygonRgn;
	alias DPtoLP = STDWINAPI.DPtoLP;
	alias LPtoDP = STDWINAPI.LPtoDP;
	alias Polygon = STDWINAPI.Polygon;
	alias Polyline = STDWINAPI.Polyline;
	alias PolyBezier = STDWINAPI.PolyBezier;
	alias PolyBezierTo = STDWINAPI.PolyBezierTo;
	alias PolylineTo = STDWINAPI.PolylineTo;
	alias SetViewportExtEx = STDWINAPI.SetViewportExtEx;
	alias SetViewportOrgEx = STDWINAPI.SetViewportOrgEx;
	alias SetWindowExtEx = STDWINAPI.SetWindowExtEx;
	alias SetWindowOrgEx = STDWINAPI.SetWindowOrgEx;
	alias OffsetViewportOrgEx = STDWINAPI.OffsetViewportOrgEx;
	alias OffsetWindowOrgEx = STDWINAPI.OffsetWindowOrgEx;
	alias ScaleViewportExtEx = STDWINAPI.ScaleViewportExtEx;
	alias ScaleWindowExtEx = STDWINAPI.ScaleWindowExtEx;
	alias SetBitmapDimensionEx = STDWINAPI.SetBitmapDimensionEx;
	alias SetBrushOrgEx = STDWINAPI.SetBrushOrgEx;
	alias GetDCOrgEx = STDWINAPI.GetDCOrgEx;
	alias FixBrushOrgEx = STDWINAPI.FixBrushOrgEx;
	alias UnrealizeObject = STDWINAPI.UnrealizeObject;
	alias GdiFlush = STDWINAPI.GdiFlush;
	alias GdiSetBatchLimit = STDWINAPI.GdiSetBatchLimit;
	alias GdiGetBatchLimit = STDWINAPI.GdiGetBatchLimit;
	alias SetICMMode = STDWINAPI.SetICMMode;
	alias CheckColorsInGamut = STDWINAPI.CheckColorsInGamut;
	alias GetColorSpace = STDWINAPI.GetColorSpace;
	alias SetColorSpace = STDWINAPI.SetColorSpace;
	alias DeleteColorSpace = STDWINAPI.DeleteColorSpace;
	alias GetDeviceGammaRamp = STDWINAPI.GetDeviceGammaRamp;
	alias SetDeviceGammaRamp = STDWINAPI.SetDeviceGammaRamp;
	alias ColorMatchToTarget = STDWINAPI.ColorMatchToTarget;
	alias CreatePropertySheetPageA = STDWINAPI.CreatePropertySheetPageA;
	alias DestroyPropertySheetPage = STDWINAPI.DestroyPropertySheetPage;
	alias InitCommonControls = STDWINAPI.InitCommonControls;
	alias ImageList_Create = STDWINAPI.ImageList_Create;
	alias ImageList_Destroy = STDWINAPI.ImageList_Destroy;
	alias ImageList_GetImageCount = STDWINAPI.ImageList_GetImageCount;
	alias ImageList_Add = STDWINAPI.ImageList_Add;
	alias ImageList_ReplaceIcon = STDWINAPI.ImageList_ReplaceIcon;
	alias ImageList_SetBkColor = STDWINAPI.ImageList_SetBkColor;
	alias ImageList_GetBkColor = STDWINAPI.ImageList_GetBkColor;
	alias ImageList_SetOverlayImage = STDWINAPI.ImageList_SetOverlayImage;
	alias ImageList_Draw = STDWINAPI.ImageList_Draw;
	alias ImageList_Replace = STDWINAPI.ImageList_Replace;
	alias ImageList_AddMasked = STDWINAPI.ImageList_AddMasked;
	alias ImageList_DrawEx = STDWINAPI.ImageList_DrawEx;
	alias ImageList_Remove = STDWINAPI.ImageList_Remove;
	alias ImageList_GetIcon = STDWINAPI.ImageList_GetIcon;
	alias ImageList_BeginDrag = STDWINAPI.ImageList_BeginDrag;
	alias ImageList_EndDrag = STDWINAPI.ImageList_EndDrag;
	alias ImageList_DragEnter = STDWINAPI.ImageList_DragEnter;
	alias ImageList_DragLeave = STDWINAPI.ImageList_DragLeave;
	alias ImageList_DragMove = STDWINAPI.ImageList_DragMove;
	alias ImageList_SetDragCursorImage = STDWINAPI.ImageList_SetDragCursorImage;
	alias ImageList_DragShowNolock = STDWINAPI.ImageList_DragShowNolock;
	alias ImageList_GetDragImage = STDWINAPI.ImageList_GetDragImage;
	alias ImageList_GetIconSize = STDWINAPI.ImageList_GetIconSize;
	alias ImageList_SetIconSize = STDWINAPI.ImageList_SetIconSize;
	alias ImageList_GetImageInfo = STDWINAPI.ImageList_GetImageInfo;
	alias ImageList_Merge = STDWINAPI.ImageList_Merge;
	alias CreateToolbarEx = STDWINAPI.CreateToolbarEx;
	alias CreateMappedBitmap = STDWINAPI.CreateMappedBitmap;
	alias MenuHelp = STDWINAPI.MenuHelp;
	alias ShowHideMenuCtl = STDWINAPI.ShowHideMenuCtl;
	alias GetEffectiveClientRect = STDWINAPI.GetEffectiveClientRect;
	alias MakeDragList = STDWINAPI.MakeDragList;
	alias DrawInsert = STDWINAPI.DrawInsert;
	alias LBItemFromPt = STDWINAPI.LBItemFromPt;
	alias CreateUpDownControl = STDWINAPI.CreateUpDownControl;
	alias RegCloseKey = STDWINAPI.RegCloseKey;
	alias RegSetKeySecurity = STDWINAPI.RegSetKeySecurity;
	alias RegFlushKey = STDWINAPI.RegFlushKey;
	alias RegGetKeySecurity = STDWINAPI.RegGetKeySecurity;
	alias RegNotifyChangeKeyValue = STDWINAPI.RegNotifyChangeKeyValue;
	alias IsValidCodePage = STDWINAPI.IsValidCodePage;
	alias GetACP = STDWINAPI.GetACP;
	alias GetOEMCP = STDWINAPI.GetOEMCP;
	alias GetCPInfo = STDWINAPI.GetCPInfo;
	alias IsDBCSLeadByte = STDWINAPI.IsDBCSLeadByte;
	alias IsDBCSLeadByteEx = STDWINAPI.IsDBCSLeadByteEx;
	alias MultiByteToWideChar = STDWINAPI.MultiByteToWideChar;
	alias WideCharToMultiByte = STDWINAPI.WideCharToMultiByte;
	alias IsValidLocale = STDWINAPI.IsValidLocale;
	alias ConvertDefaultLocale = STDWINAPI.ConvertDefaultLocale;
	alias GetThreadLocale = STDWINAPI.GetThreadLocale;
	alias SetThreadLocale = STDWINAPI.SetThreadLocale;
	alias GetSystemDefaultLangID = STDWINAPI.GetSystemDefaultLangID;
	alias GetUserDefaultLangID = STDWINAPI.GetUserDefaultLangID;
	alias GetSystemDefaultLCID = STDWINAPI.GetSystemDefaultLCID;
	alias GetUserDefaultLCID = STDWINAPI.GetUserDefaultLCID;
	alias ReadConsoleOutputAttribute = STDWINAPI.ReadConsoleOutputAttribute;
	alias WriteConsoleOutputAttribute = STDWINAPI.WriteConsoleOutputAttribute;
	alias FillConsoleOutputAttribute = STDWINAPI.FillConsoleOutputAttribute;
	alias GetConsoleMode = STDWINAPI.GetConsoleMode;
	alias GetNumberOfConsoleInputEvents = STDWINAPI.GetNumberOfConsoleInputEvents;
	alias GetConsoleScreenBufferInfo = STDWINAPI.GetConsoleScreenBufferInfo;
	alias GetLargestConsoleWindowSize = STDWINAPI.GetLargestConsoleWindowSize;
	alias GetConsoleCursorInfo = STDWINAPI.GetConsoleCursorInfo;
	alias GetNumberOfConsoleMouseButtons = STDWINAPI.GetNumberOfConsoleMouseButtons;
	alias SetConsoleMode = STDWINAPI.SetConsoleMode;
	alias SetConsoleActiveScreenBuffer = STDWINAPI.SetConsoleActiveScreenBuffer;
	alias FlushConsoleInputBuffer = STDWINAPI.FlushConsoleInputBuffer;
	alias SetConsoleScreenBufferSize = STDWINAPI.SetConsoleScreenBufferSize;
	alias SetConsoleCursorPosition = STDWINAPI.SetConsoleCursorPosition;
	alias SetConsoleCursorInfo = STDWINAPI.SetConsoleCursorInfo;
	alias SetConsoleWindowInfo = STDWINAPI.SetConsoleWindowInfo;
	alias SetConsoleTextAttribute = STDWINAPI.SetConsoleTextAttribute;
	alias SetConsoleCtrlHandler = STDWINAPI.SetConsoleCtrlHandler;
	alias GenerateConsoleCtrlEvent = STDWINAPI.GenerateConsoleCtrlEvent;
	alias AllocConsole = STDWINAPI.AllocConsole;
	alias FreeConsole = STDWINAPI.FreeConsole;
	alias CreateConsoleScreenBuffer = STDWINAPI.CreateConsoleScreenBuffer;
	alias GetConsoleCP = STDWINAPI.GetConsoleCP;
	alias SetConsoleCP = STDWINAPI.SetConsoleCP;
	alias GetConsoleOutputCP = STDWINAPI.GetConsoleOutputCP;
	alias SetConsoleOutputCP = STDWINAPI.SetConsoleOutputCP;
	alias WNetConnectionDialog = STDWINAPI.WNetConnectionDialog;
	alias WNetDisconnectDialog = STDWINAPI.WNetDisconnectDialog;
	alias WNetCloseEnum = STDWINAPI.WNetCloseEnum;
	alias CloseServiceHandle = STDWINAPI.CloseServiceHandle;
	alias ControlService = STDWINAPI.ControlService;
	alias DeleteService = STDWINAPI.DeleteService;
	alias LockServiceDatabase = STDWINAPI.LockServiceDatabase;
	alias NotifyBootConfigStatus = STDWINAPI.NotifyBootConfigStatus;
	alias QueryServiceObjectSecurity = STDWINAPI.QueryServiceObjectSecurity;
	alias QueryServiceStatus = STDWINAPI.QueryServiceStatus;
	alias SetServiceObjectSecurity = STDWINAPI.SetServiceObjectSecurity;
	alias SetServiceStatus = STDWINAPI.SetServiceStatus;
	alias UnlockServiceDatabase = STDWINAPI.UnlockServiceDatabase;
	alias ChoosePixelFormat = STDWINAPI.ChoosePixelFormat;
	alias DescribePixelFormat = STDWINAPI.DescribePixelFormat;
	alias SetPixelFormat = STDWINAPI.SetPixelFormat;
	alias SwapBuffers = STDWINAPI.SwapBuffers;
	alias DragQueryPoint = STDWINAPI.DragQueryPoint;
	alias DragFinish = STDWINAPI.DragFinish;
	alias DragAcceptFiles = STDWINAPI.DragAcceptFiles;
	alias DuplicateIcon = STDWINAPI.DuplicateIcon;
	alias DdeAbandonTransaction = STDWINAPI.DdeAbandonTransaction;
	alias DdeAccessData = STDWINAPI.DdeAccessData;
	alias DdeAddData = STDWINAPI.DdeAddData;
	alias DdeClientTransaction = STDWINAPI.DdeClientTransaction;
	alias DdeCmpStringHandles = STDWINAPI.DdeCmpStringHandles;
	alias DdeConnect = STDWINAPI.DdeConnect;
	alias DdeConnectList = STDWINAPI.DdeConnectList;
	alias DdeCreateDataHandle = STDWINAPI.DdeCreateDataHandle;
	alias DdeDisconnect = STDWINAPI.DdeDisconnect;
	alias DdeDisconnectList = STDWINAPI.DdeDisconnectList;
	alias DdeEnableCallback = STDWINAPI.DdeEnableCallback;
	alias DdeFreeDataHandle = STDWINAPI.DdeFreeDataHandle;
	alias DdeFreeStringHandle = STDWINAPI.DdeFreeStringHandle;
	alias DdeGetData = STDWINAPI.DdeGetData;
	alias DdeGetLastError = STDWINAPI.DdeGetLastError;
	alias DdeImpersonateClient = STDWINAPI.DdeImpersonateClient;
	alias DdeKeepStringHandle = STDWINAPI.DdeKeepStringHandle;
	alias DdeNameService = STDWINAPI.DdeNameService;
	alias DdePostAdvise = STDWINAPI.DdePostAdvise;
	alias DdeQueryConvInfo = STDWINAPI.DdeQueryConvInfo;
	alias DdeQueryNextServer = STDWINAPI.DdeQueryNextServer;
	alias DdeReconnect = STDWINAPI.DdeReconnect;
	alias DdeSetUserHandle = STDWINAPI.DdeSetUserHandle;
	alias DdeUnaccessData = STDWINAPI.DdeUnaccessData;
	alias DdeUninitialize = STDWINAPI.DdeUninitialize;
	alias SHAddToRecentDocs = STDWINAPI.SHAddToRecentDocs;
	alias SHBrowseForFolder = STDWINAPI.SHBrowseForFolder;
	alias SHChangeNotify = STDWINAPI.SHChangeNotify;
	alias SHFileOperationA = STDWINAPI.SHFileOperationA;
	alias SHFileOperationW = STDWINAPI.SHFileOperationW;
	alias SHFreeNameMappings = STDWINAPI.SHFreeNameMappings;
	extern (Windows) { //Workaround Tango bugs
		DWORD_PTR SHGetFileInfoA(LPCSTR, DWORD, SHFILEINFOA*, UINT, UINT);
		DWORD_PTR SHGetFileInfoW(LPCWSTR, DWORD, SHFILEINFOW*, UINT, UINT);
		WINBOOL SHGetPathFromIDListA(LPCITEMIDLIST, LPSTR);
		WINBOOL SHGetPathFromIDListW(LPCITEMIDLIST, LPWSTR);
	}
	alias SHGetSpecialFolderLocation = STDWINAPI.SHGetSpecialFolderLocation;
	alias CreateThread = STDWINAPI.CreateThread;
	alias DdeSetQualityOfService = STDWINAPI.DdeSetQualityOfService;
	alias GetCommMask = STDWINAPI.GetCommMask;
	alias GetDiskFreeSpaceExA = STDWINAPI.GetDiskFreeSpaceExA;
	alias GetDiskFreeSpaceExW = STDWINAPI.GetDiskFreeSpaceExW;
	alias GetKerningPairs = STDWINAPI.GetKerningPairs;
	alias GetOverlappedResult = STDWINAPI.GetOverlappedResult;
	alias GetQueuedCompletionStatus = STDWINAPI.GetQueuedCompletionStatus;
	alias GetSystemPowerStatus = STDWINAPI.GetSystemPowerStatus;
	alias ReadFile = STDWINAPI.ReadFile;
	alias SetThreadContext = STDWINAPI.SetThreadContext;
	alias wglDescribeLayerPlane = STDWINAPI.wglDescribeLayerPlane;
	alias wglGetLayerPaletteEntries = STDWINAPI.wglGetLayerPaletteEntries;
	alias wglSetLayerPaletteEntries = STDWINAPI.wglSetLayerPaletteEntries;
	alias WNetGetResourceParentA = STDWINAPI.WNetGetResourceParentA;
	alias WriteFile = STDWINAPI.WriteFile;
	alias CancelWaitableTimer = STDWINAPI.CancelWaitableTimer;
	alias OpenWaitableTimerA = STDWINAPI.OpenWaitableTimerA;
	alias OpenWaitableTimerW = STDWINAPI.OpenWaitableTimerW;
	alias CreateWaitableTimerA = STDWINAPI.CreateWaitableTimerA;
	alias CreateWaitableTimerW = STDWINAPI.CreateWaitableTimerW;
	alias SetWaitableTimer = STDWINAPI.SetWaitableTimer;
}
else { // Phobos
	import std.stdint;

	/+ Functions +/
	extern (Windows) {
		BOOL GetWindowInfo(HWND, PWINDOWINFO);
		BOOL EnumDisplayMonitors(HDC, RECT*, MONITORENUMPROC, LPARAM);
		BOOL GetMonitorInfoA(HMONITOR, LPMONITORINFO);
		WINBOOL GetBinaryTypeA(LPCSTR, LPDWORD);
		DWORD GetShortPathNameA(LPCSTR, LPSTR, DWORD);
		LPSTR GetEnvironmentStringsA();
		WINBOOL FreeEnvironmentStringsA(LPSTR);
		DWORD FormatMessageA(DWORD, LPCVOID, DWORD, DWORD, LPSTR, DWORD, VA_LIST*);
		HANDLE CreateMailslotA(LPCSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		int lstrcmpA(LPCSTR, LPCSTR);
		int lstrcmpiA(LPCSTR, LPCSTR);
		LPSTR lstrcpynA(LPSTR, LPCSTR, int);
		LPSTR lstrcpyA(LPSTR, LPCSTR);
		LPSTR lstrcatA(LPSTR, LPCSTR);
		int lstrlenA(LPCSTR);
		HANDLE CreateMutexA(LPSECURITY_ATTRIBUTES, WINBOOL, LPCSTR);
		HANDLE OpenMutexA(DWORD, WINBOOL, LPCSTR);
		HANDLE CreateEventA(LPSECURITY_ATTRIBUTES, WINBOOL, WINBOOL, LPCSTR);
		HANDLE OpenEventA(DWORD, WINBOOL, LPCSTR);
		HANDLE CreateSemaphoreA(LPSECURITY_ATTRIBUTES, LONG, LONG, LPCSTR);
		HANDLE OpenSemaphoreA(DWORD, WINBOOL, LPCSTR);
		HANDLE CreateFileMappingA(HANDLE, LPSECURITY_ATTRIBUTES, DWORD, DWORD, DWORD, LPCSTR);
		HANDLE OpenFileMappingA(DWORD, WINBOOL, LPCSTR);
		DWORD GetLogicalDriveStringsA(DWORD, LPSTR);
		HINST LoadLibraryA(LPCSTR);
		HINST LoadLibraryExA(LPCSTR, HANDLE, DWORD);
		DWORD GetModuleFileNameA(HINST, LPSTR, DWORD);
		HMODULE GetModuleHandleA(LPCSTR);
		void FatalAppExitA(UINT);
		LPSTR GetCommandLineA();
		DWORD GetEnvironmentVariableA(LPCSTR, LPSTR, DWORD);
		WINBOOL SetEnvironmentVariableA(LPCSTR, LPCSTR);
		DWORD ExpandEnvironmentStringsA(LPCSTR, LPSTR, DWORD);
		void OutputDebugStringA(LPCSTR);
		HRSRC FindResourceA(HINST, LPCSTR, LPCSTR);
		HRSRC FindResourceExA(HINST, LPCSTR, LPCSTR, ushort);
		WINBOOL EnumResourceTypesA(HINST, ENUMRESTYPEPROC, LONG_PTR);
		WINBOOL EnumResourceNamesA(HINST, LPCSTR, ENUMRESNAMEPROC, LONG_PTR);
		WINBOOL EnumResourceLanguagesA(HINST, LPCSTR, LPCSTR, ENUMRESLANGPROC, LONG_PTR);
		HANDLE BeginUpdateResourceA(LPCSTR, WINBOOL);
		WINBOOL UpdateResourceA(HANDLE, LPCSTR, LPCSTR, ushort, LPVOID, DWORD);
		WINBOOL EndUpdateResourceA(HANDLE, WINBOOL);
		ATOM GlobalAddAtomA(LPCSTR);
		ATOM GlobalFindAtomA(LPCSTR);
		UINT GlobalGetAtomNameA(ATOM, LPSTR, int);
		ATOM AddAtomA(LPCSTR);
		ATOM FindAtomA(LPCSTR);
		UINT GetAtomNameA(ATOM, LPSTR, int);
		UINT GetProfileIntA(LPCSTR, LPCSTR, INT);
		DWORD GetProfileStringA(LPCSTR, LPCSTR, LPCSTR, LPSTR, DWORD);
		WINBOOL WriteProfileStringA(LPCSTR, LPCSTR, LPCSTR);
		DWORD GetProfileSectionA(LPCSTR, LPSTR, DWORD);
		WINBOOL WriteProfileSectionA(LPCSTR, LPCSTR);
		UINT GetPrivateProfileIntA(LPCSTR, LPCSTR, INT, LPCSTR);
		DWORD GetPrivateProfileStringA(LPCSTR, LPCSTR, LPCSTR, LPSTR, DWORD, LPCSTR);
		WINBOOL WritePrivateProfileStringA(LPCSTR, LPCSTR, LPCSTR, LPCSTR);
		DWORD GetPrivateProfileSectionA(LPCSTR, LPSTR, DWORD, LPCSTR);
		WINBOOL WritePrivateProfileSectionA(LPCSTR, LPCSTR, LPCSTR);
		UINT GetDriveTypeA(LPCSTR);
		UINT GetSystemDirectoryA(LPSTR, UINT);
		DWORD GetTempPathA(DWORD, LPSTR);
		UINT GetTempFileNameA(LPCSTR, LPCSTR, UINT, LPSTR);
		UINT GetWindowsDirectoryA(LPSTR, UINT);
		WINBOOL SetCurrentDirectoryA(LPCSTR);
		DWORD GetCurrentDirectoryA(DWORD, LPSTR);
		WINBOOL GetDiskFreeSpaceA(LPCSTR, LPDWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL CreateDirectoryA(LPCSTR, LPSECURITY_ATTRIBUTES);
		WINBOOL CreateDirectoryExA(LPCSTR, LPCSTR, LPSECURITY_ATTRIBUTES);
		WINBOOL RemoveDirectoryA(LPCSTR);
		DWORD GetFullPathNameA(LPCSTR, DWORD, LPSTR, LPSTR*);
		WINBOOL DefineDosDeviceA(DWORD, LPCSTR, LPCSTR);
		DWORD QueryDosDeviceA(LPCSTR, LPSTR, DWORD);
		HANDLE CreateFileA(LPCSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES, DWORD, DWORD, HANDLE);
		WINBOOL SetFileAttributesA(LPCSTR, DWORD);
		DWORD GetFileAttributesA(LPCSTR);
		BOOL GetFileAttributesExA(LPCSTR, DWORD, WIN32_FILE_ATTRIBUTE_DATA*);
		DWORD GetCompressedFileSizeA(LPCSTR, LPDWORD);
		WINBOOL DeleteFileA(LPCSTR);
		DWORD SearchPathA(LPCSTR, LPCSTR, LPCSTR, DWORD, LPSTR, LPSTR);
		WINBOOL CopyFileA(LPCSTR, LPCSTR, WINBOOL);
		WINBOOL MoveFileA(LPCSTR, LPCSTR);
		WINBOOL MoveFileExA(LPCSTR, LPCSTR, DWORD);
		HANDLE CreateNamedPipeA(LPCSTR, DWORD, DWORD, DWORD, DWORD, DWORD,
				DWORD, LPSECURITY_ATTRIBUTES);
		WINBOOL GetNamedPipeHandleStateA(HANDLE, LPDWORD, LPDWORD, LPDWORD, LPDWORD, LPSTR, DWORD);
		WINBOOL CallNamedPipeA(LPCSTR, LPVOID, DWORD, LPVOID, DWORD, LPDWORD, DWORD);
		WINBOOL WaitNamedPipeA(LPCSTR, DWORD);
		WINBOOL SetVolumeLabelA(LPCSTR, LPCSTR);
		WINBOOL GetVolumeInformationA(LPCSTR, LPSTR, DWORD, LPDWORD, LPDWORD,
				LPDWORD, LPSTR, DWORD);
		WINBOOL ClearEventLogA(HANDLE, LPCSTR);
		WINBOOL BackupEventLogA(HANDLE, LPCSTR);
		HANDLE OpenEventLogA(LPCSTR, LPCSTR);
		HANDLE RegisterEventSourceA(LPCSTR, LPCSTR);
		HANDLE OpenBackupEventLogA(LPCSTR, LPCSTR);
		WINBOOL ReadEventLogA(HANDLE, DWORD, DWORD, LPVOID, DWORD, LPDWORD, LPDWORD);
		WINBOOL ReportEventA(HANDLE, ushort, ushort, DWORD, PSID, ushort, DWORD, LPCSTR*, LPVOID);
		WINBOOL AccessCheckAndAuditAlarmA(LPCSTR, LPVOID, LPSTR, LPSTR,
				PSECURITY_DESCRIPTOR, DWORD, PGENERIC_MAPPING, WINBOOL, LPDWORD, LPBOOL, LPBOOL);
		WINBOOL ObjectOpenAuditAlarmA(LPCSTR, LPVOID, LPSTR, LPSTR, PSECURITY_DESCRIPTOR,
				HANDLE, DWORD, DWORD, PPRIVILEGE_SET, WINBOOL, WINBOOL, LPBOOL);
		WINBOOL ObjectPrivilegeAuditAlarmA(LPCSTR, LPVOID, HANDLE, DWORD, PPRIVILEGE_SET, WINBOOL);
		WINBOOL ObjectCloseAuditAlarmA(LPCSTR, LPVOID, WINBOOL);
		WINBOOL PrivilegedServiceAuditAlarmA(LPCSTR, LPCSTR, HANDLE, PPRIVILEGE_SET, WINBOOL);
		WINBOOL SetFileSecurityA(LPCSTR, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		WINBOOL GetFileSecurityA(LPCSTR, SECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, DWORD, LPDWORD);
		HANDLE FindFirstChangeNotificationA(LPCSTR, WINBOOL, DWORD);
		WINBOOL IsBadStringPtrA(LPCSTR, UINT_PTR);
		WINBOOL LookupAccountSidA(LPCSTR, PSID, LPSTR, LPDWORD, LPSTR, LPDWORD, PSID_NAME_USE);
		WINBOOL LookupAccountNameA(LPCSTR, LPCSTR, PSID, LPDWORD, LPSTR, LPDWORD, PSID_NAME_USE);
		WINBOOL LookupPrivilegeValueA(LPCSTR, LPCSTR, PLUID);
		WINBOOL LookupPrivilegeNameA(LPCSTR, PLUID, LPSTR, LPDWORD);
		WINBOOL LookupPrivilegeDisplayNameA(LPCSTR, LPCSTR, LPSTR, LPDWORD, LPDWORD);
		WINBOOL BuildCommDCBA(LPCSTR, LPDCB);
		WINBOOL BuildCommDCBAndTimeoutsA(LPCSTR, LPDCB, LPCOMMTIMEOUTS);
		WINBOOL CommConfigDialogA(LPCSTR, HWND, LPCOMMCONFIG);
		WINBOOL GetDefaultCommConfigA(LPCSTR, LPCOMMCONFIG, LPDWORD);
		WINBOOL SetDefaultCommConfigA(LPCSTR, LPCOMMCONFIG, DWORD);
		WINBOOL GetComputerNameA(LPSTR, LPDWORD);
		WINBOOL SetComputerNameA(LPCSTR);
		WINBOOL GetUserNameA(LPSTR, LPDWORD);
		int wvsprintfA(LPSTR, LPCSTR, VA_LIST*);
		HKL LoadKeyboardLayoutA(LPCSTR, UINT);
		WINBOOL GetKeyboardLayoutNameA(LPSTR);
		HDESK CreateDesktopA(LPSTR, LPSTR, LPDEVMODE, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		HDESK OpenDesktopA(LPSTR, DWORD, WINBOOL, DWORD);
		WINBOOL EnumDesktopsA(HWINSTA, DESKTOPENUMPROC, LPARAM);
		HWINSTA CreateWindowStationA(LPSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		HWINSTA OpenWindowStationA(LPSTR, WINBOOL, DWORD);
		WINBOOL EnumWindowStationsA(ENUMWINDOWSTATIONPROC, LPARAM);
		WINBOOL GetUserObjectInformationA(HANDLE, int, PVOID, DWORD, LPDWORD);
		WINBOOL SetUserObjectInformationA(HANDLE, int, PVOID, DWORD);
		UINT RegisterWindowMessageA(LPCSTR);
		WINBOOL GetMessageA(LPMSG, HWND, UINT, UINT);
		LONG DispatchMessageA(LPMSG);
		WINBOOL PeekMessageA(LPMSG, HWND, UINT, UINT, UINT);
		LRESULT SendMessageA(HWND, UINT, WPARAM, LPARAM);
		LRESULT SendMessageA(HWND, UINT, void*, LPARAM);
		LRESULT SendMessageA(HWND, UINT, WPARAM, void*);
		LRESULT SendMessageA(HWND, UINT, void*, void*);
		LRESULT SendMessageTimeoutA(HWND, UINT, WPARAM, LPARAM, UINT, UINT, PDWORD_PTR);
		WINBOOL SendNotifyMessageA(HWND, UINT, WPARAM, LPARAM);
		WINBOOL SendMessageCallbackA(HWND, UINT, WPARAM, LPARAM, SENDASYNCPROC, ULONG_PTR);
		WINBOOL PostMessageA(HWND, UINT, WPARAM, LPARAM);
		WINBOOL PostThreadMessageA(DWORD, UINT, WPARAM, LPARAM);
		LRESULT DefWindowProcA(HWND, UINT, WPARAM, LPARAM);
		LRESULT CallWindowProcA(WNDPROC, HWND, UINT, WPARAM, LPARAM);
		ATOM RegisterClassA(LPWNDCLASSA);
		WINBOOL UnregisterClassA(LPCSTR, HINST);
		WINBOOL GetClassInfoA(HINST, LPCSTR, LPWNDCLASS);
		ATOM RegisterClassExA(LPWNDCLASSEX);
		WINBOOL GetClassInfoExA(HINST, LPCSTR, LPWNDCLASSEX);
		HWND CreateWindowExA(DWORD, LPCSTR, LPCSTR, DWORD, int, int, int, int,
				HWND, HMENU, HINST, LPVOID);
		HWND CreateDialogParamA(HINST, LPCSTR, HWND, DLGPROC, LPARAM);
		HWND CreateDialogIndirectParamA(HINST, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
		INT_PTR DialogBoxParamA(HINST, LPCSTR, HWND, DLGPROC, LPARAM);
		INT_PTR DialogBoxIndirectParamA(HINST, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
		WINBOOL SetDlgItemTextA(HWND, int, LPCSTR);
		UINT GetDlgItemTextA(HWND, int, LPSTR, int);
		LONG SendDlgItemMessageA(HWND, int, UINT, WPARAM, LPARAM);
		LRESULT DefDlgProcA(HWND, UINT, WPARAM, LPARAM);
		WINBOOL CallMsgFilterA(LPMSG, int);
		UINT RegisterClipboardFormatA(LPCSTR);
		int GetClipboardFormatNameA(UINT, LPSTR, int);
		WINBOOL CharToOemA(LPCSTR, LPSTR);
		WINBOOL OemToCharA(LPCSTR, LPSTR);
		WINBOOL CharToOemBuffA(LPCSTR, LPSTR, DWORD);
		WINBOOL OemToCharBuffA(LPCSTR, LPSTR, DWORD);
		LPSTR CharUpperA(LPSTR);
		DWORD CharUpperBuffA(LPSTR, DWORD);
		LPSTR CharLowerA(LPSTR);
		DWORD CharLowerBuffA(LPSTR, DWORD);
		LPSTR CharNextA(LPCSTR);
		LPSTR CharPrevA(LPCSTR, LPCSTR);
		WINBOOL IsCharAlphaA(char);
		WINBOOL IsCharAlphaNumericA(char);
		WINBOOL IsCharUpperA(char);
		WINBOOL IsCharLowerA(char);
		int GetKeyNameTextA(LONG, LPSTR, int);
		SHORT VkKeyScanA(char);
		SHORT VkKeyScanExA(char, HKL);
		UINT MapVirtualKeyA(UINT, UINT);
		UINT MapVirtualKeyExA(UINT, UINT, HKL);
		HACCEL LoadAcceleratorsA(HINST, LPCSTR);
		HACCEL CreateAcceleratorTableA(LPACCEL, int);
		int CopyAcceleratorTableA(HACCEL, LPACCEL, int);
		int TranslateAcceleratorA(HWND, HACCEL, LPMSG);
		HMENU LoadMenuA(HINST, LPCSTR);
		HMENU LoadMenuIndirectA(LPMENUTEMPLATE);
		WINBOOL ChangeMenuA(HMENU, UINT, LPCSTR, UINT, UINT);
		int GetMenuStringA(HMENU, UINT, LPSTR, int, UINT);
		WINBOOL InsertMenuA(HMENU, UINT, UINT, UINT_PTR, LPCSTR);
		WINBOOL AppendMenuA(HMENU, UINT, UINT_PTR, LPCSTR);
		WINBOOL ModifyMenuA(HMENU, UINT, UINT, UINT_PTR, LPCSTR);
		WINBOOL InsertMenuItemA(HMENU, UINT, WINBOOL, LPCMENUITEMINFO);
		WINBOOL GetMenuItemInfoA(HMENU, UINT, WINBOOL, LPMENUITEMINFO);
		WINBOOL SetMenuItemInfoA(HMENU, UINT, WINBOOL, LPCMENUITEMINFO);
		int DrawTextA(HDC, LPCSTR, int, LPRECT, UINT);
		int DrawTextExA(HDC, LPSTR, int, LPRECT, UINT, LPDRAWTEXTPARAMS);
		WINBOOL GrayStringA(HDC, HBRUSH, GRAYSTRINGPROC, LPARAM, int, int, int, int, int);
		WINBOOL DrawStateA(HDC, HBRUSH, DRAWSTATEPROC, LPARAM, WPARAM, int, int, int, int, UINT);
		LONG TabbedTextOutA(HDC, int, int, LPCSTR, int, int, LPINT, int);
		DWORD GetTabbedTextExtentA(HDC, LPCSTR, int, int, LPINT);
		WINBOOL SetPropA(HWND, LPCSTR, HANDLE);
		HANDLE GetPropA(HWND, LPCSTR);
		HANDLE RemovePropA(HWND, LPCSTR);
		int EnumPropsExA(HWND, PROPENUMPROCEX, LPARAM);
		int EnumPropsA(HWND, PROPENUMPROC);
		WINBOOL SetWindowTextA(HWND, LPCSTR);
		int GetWindowTextA(HWND, LPSTR, int);
		int GetWindowTextLengthA(HWND);
		int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
		int MessageBoxExA(HWND, LPCSTR, LPCSTR, UINT, ushort);
		int MessageBoxIndirectA(LPMSGBOXPARAMS);
		LONG GetWindowLongA(HWND, int);
		LONG SetWindowLongA(HWND, int, LONG);
		version (Win32) {
			alias GetWindowLongPtrA = GetWindowLongA;
			alias SetWindowLongPtrA = SetWindowLongA;
		}
		else {
			LONG_PTR GetWindowLongPtrA(HWND, int);
			LONG_PTR SetWindowLongPtrA(HWND, int, LONG_PTR);
		}
		DWORD GetClassLongA(HWND, int);
		DWORD SetClassLongA(HWND, int, LONG);
		HWND FindWindowA(LPCSTR, LPCSTR);
		HWND FindWindowExA(HWND, HWND, LPCSTR, LPCSTR);
		int GetClassNameA(HWND, LPSTR, int);
		HHOOK SetWindowsHookExA(int, HOOKPROC, HINST, DWORD);
		HBITMAP LoadBitmapA(HINST, LPCSTR);
		HCURSOR LoadCursorA(HINST, LPCSTR);
		HCURSOR LoadCursorFromFileA(LPCSTR);
		HICON LoadIconA(HINST, LPCSTR);
		HANDLE LoadImageA(HINST, LPCSTR, UINT, int, int, UINT);
		int LoadStringA(HINST, UINT, LPSTR, int);
		WINBOOL IsDialogMessageA(HWND, LPMSG);
		int DlgDirListA(HWND, LPSTR, int, int, UINT);
		WINBOOL DlgDirSelectExA(HWND, LPSTR, int, int);
		int DlgDirListComboBoxA(HWND, LPSTR, int, int, UINT);
		WINBOOL DlgDirSelectComboBoxExA(HWND, LPSTR, int, int);
		LRESULT DefFrameProcA(HWND, HWND, UINT, WPARAM, LPARAM);
		LRESULT DefMDIChildProcA(HWND, UINT, WPARAM, LPARAM);
		HWND CreateMDIWindowA(LPSTR, LPSTR, DWORD, int, int, int, int, HWND, HINST, LPARAM);
		WINBOOL WinHelpA(HWND, LPCSTR, UINT, ULONG_PTR);
		LONG ChangeDisplaySettingsA(LPDEVMODE, DWORD);
		WINBOOL EnumDisplaySettingsA(LPCSTR, DWORD, LPDEVMODE);
		WINBOOL SystemParametersInfoA(UINT, UINT, PVOID, UINT);
		int AddFontResourceA(LPCSTR);
		HMETAFILE CopyMetaFileA(HMETAFILE, LPCSTR);
		HFONT CreateFontIndirectA(LPLOGFONT);
		HDC CreateICA(LPCSTR, LPCSTR, LPCSTR, LPDEVMODE);
		HDC CreateMetaFileA(LPCSTR);
		WINBOOL CreateScalableFontResourceA(DWORD, LPCSTR, LPCSTR, LPCSTR);
		int EnumFontFamiliesExA(HDC, LPLOGFONT, FONTENUMEXPROC, LPARAM, DWORD);
		int EnumFontFamiliesA(HDC, LPCSTR, FONTENUMPROC, LPARAM);
		int EnumFontsA(HDC, LPCSTR, ENUMFONTSPROC, LPARAM);
		WINBOOL GetCharWidthA(HDC, UINT, UINT, LPINT);
		WINBOOL GetCharWidth32A(HDC, UINT, UINT, LPINT);
		WINBOOL GetCharWidthFloatA(HDC, UINT, UINT, PFLOAT);
		WINBOOL GetCharABCWidthsA(HDC, UINT, UINT, LPABC);
		WINBOOL GetCharABCWidthsFloatA(HDC, UINT, UINT, LPABCFLOAT);
		DWORD GetGlyphOutlineA(HDC, UINT, UINT, LPGLYPHMETRICS, DWORD, LPVOID, PMAT2);
		HMETAFILE GetMetaFileA(LPCSTR);
		UINT GetOutlineTextMetricsA(HDC, UINT, LPOUTLINETEXTMETRIC);
		WINBOOL GetTextExtentPointA(HDC, LPCSTR, int, LPSIZE);
		WINBOOL GetTextExtentPoint32A(HDC, LPCSTR, int, LPSIZE);
		WINBOOL GetTextExtentExPointA(HDC, LPCSTR, int, int, LPINT, LPINT, LPSIZE);
		DWORD GetCharacterPlacementA(HDC, LPCSTR, int, int, LPGCP_RESULTS, DWORD);
		HDC ResetDCA(HDC, LPDEVMODE);
		WINBOOL RemoveFontResourceA(LPCSTR);
		HENHMETAFILE CopyEnhMetaFileA(HENHMETAFILE, LPCSTR);
		HDC CreateEnhMetaFileA(HDC, LPCSTR, LPRECT, LPCSTR);
		HENHMETAFILE GetEnhMetaFileA(LPCSTR);
		UINT GetEnhMetaFileDescriptionA(HENHMETAFILE, UINT, LPSTR);
		WINBOOL GetTextMetricsA(HDC, LPTEXTMETRIC);
		int StartDocA(HDC, PDOCINFO);
		int GetObjectA(HGDIOBJ, int, LPVOID);
		WINBOOL TextOutA(HDC, int, int, LPCSTR, int);
		WINBOOL ExtTextOutA(HDC, int, int, UINT, LPRECT, LPCSTR, UINT, LPINT);
		WINBOOL PolyTextOutA(HDC, PPOLYTEXT, int);
		int GetTextFaceA(HDC, int, LPSTR);
		DWORD GetKerningPairsA(HDC, DWORD, LPKERNINGPAIR);
		HCOLORSPACE CreateColorSpaceA(LPLOGCOLORSPACE);
		WINBOOL GetLogColorSpaceA(HCOLORSPACE, LPLOGCOLORSPACE, DWORD);
		WINBOOL GetICMProfileA(HDC, DWORD, LPSTR);
		WINBOOL SetICMProfileA(HDC, LPSTR);
		WINBOOL UpdateICMRegKeyA(DWORD, DWORD, LPSTR, UINT);
		int EnumICMProfilesA(HDC, ICMENUMPROC, LPARAM);
		INT_PTR PropertySheetA(LPCPROPSHEETHEADER);
		HIMAGELIST ImageList_LoadImageA(HINST, LPCSTR, int, int, COLORREF, UINT, UINT);
		HWND CreateStatusWindowA(LONG, LPCSTR, HWND, UINT);
		void DrawStatusTextA(HDC, LPRECT, LPCSTR);
		WINBOOL GetOpenFileNameA(LPOPENFILENAME);
		WINBOOL GetSaveFileNameA(LPOPENFILENAME);
		int GetFileTitleA(LPCSTR, LPSTR, ushort);
		WINBOOL ChooseColorA(LPCHOOSECOLOR);
		HWND FindTextA(LPFINDREPLACE);
		HWND ReplaceTextA(LPFINDREPLACE);
		WINBOOL ChooseFontA(LPCHOOSEFONTA);
		WINBOOL PrintDlgA(LPPRINTDLGA);
		WINBOOL PageSetupDlgA(LPPAGESETUPDLG);
		WINBOOL CreateProcessA(LPCSTR, LPSTR, LPSECURITY_ATTRIBUTES, LPSECURITY_ATTRIBUTES,
				WINBOOL, DWORD, LPVOID, LPCSTR, LPSTARTUPINFO, LPPROCESS_INFORMATION);
		void GetStartupInfoA(LPSTARTUPINFO);
		HANDLE FindFirstFileA(LPCSTR, LPWIN32_FIND_DATA);
		WINBOOL FindNextFileA(HANDLE, LPWIN32_FIND_DATA);
		WINBOOL GetVersionExA(LPOSVERSIONINFO);
		HDC CreateDCA(LPCSTR, LPCSTR, LPCSTR, PDEVMODE);
		DWORD VerInstallFileA(DWORD, LPSTR, LPSTR, LPSTR, LPSTR, LPSTR, LPSTR, PUINT);
		DWORD GetFileVersionInfoSizeA(LPSTR, LPDWORD);
		WINBOOL GetFileVersionInfoA(LPSTR, DWORD, DWORD, LPVOID);
		DWORD VerLanguageNameA(DWORD, LPSTR, DWORD);
		WINBOOL VerQueryValueA(LPVOID, LPSTR, LPVOID, PUINT);
		DWORD VerFindFileA(DWORD, LPSTR, LPSTR, LPSTR, LPSTR, PUINT, LPSTR, PUINT);
		LONG RegConnectRegistryA(LPSTR, HKEY, PHKEY);
		LONG RegCreateKeyA(HKEY, LPCSTR, PHKEY);
		LONG RegCreateKeyExA(HKEY, LPCSTR, DWORD, LPSTR, DWORD, REGSAM,
				LPSECURITY_ATTRIBUTES, PHKEY, LPDWORD);
		LONG RegDeleteKeyA(HKEY, LPCSTR);
		LONG RegDeleteValueA(HKEY, LPCSTR);
		LONG RegEnumKeyA(HKEY, DWORD, LPSTR, DWORD);
		LONG RegEnumKeyExA(HKEY, DWORD, LPSTR, LPDWORD, LPDWORD, LPSTR, LPDWORD, PFILETIME);
		LONG RegEnumValueA(HKEY, DWORD, LPSTR, LPDWORD, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
		LONG RegLoadKeyA(HKEY, LPCSTR, LPCSTR);
		LONG RegOpenKeyA(HKEY, LPCSTR, PHKEY);
		LONG RegOpenKeyExA(HKEY, LPCSTR, DWORD, REGSAM, PHKEY);
		LONG RegQueryInfoKeyA(HKEY, LPSTR, LPDWORD, LPDWORD, LPDWORD, LPDWORD,
				LPDWORD, LPDWORD, LPDWORD, LPDWORD, LPDWORD, PFILETIME);
		LONG RegQueryValueA(HKEY, LPCSTR, LPSTR, PLONG);
		LONG RegQueryMultipleValuesA(HKEY, PVALENT, DWORD, LPSTR, LPDWORD);
		LONG RegQueryValueExA(HKEY, LPCSTR, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
		LONG RegReplaceKeyA(HKEY, LPCSTR, LPCSTR, LPCSTR);
		LONG RegRestoreKeyA(HKEY, LPCSTR, DWORD);
		LONG RegSaveKeyA(HKEY, LPCSTR, LPSECURITY_ATTRIBUTES);
		LONG RegSetValueA(HKEY, LPCSTR, DWORD, LPCSTR, DWORD);
		LONG RegSetValueExA(HKEY, LPCSTR, DWORD, DWORD, LPBYTE, DWORD);
		LONG RegUnLoadKeyA(HKEY, LPCSTR);
		WINBOOL InitiateSystemShutdownA(LPSTR, LPSTR, DWORD, WINBOOL, WINBOOL);
		WINBOOL AbortSystemShutdownA(LPSTR);
		int CompareStringA(LCID, DWORD, LPCSTR, int, LPCSTR, int);
		int LCMapStringA(LCID, DWORD, LPCSTR, int, LPSTR, int);
		int GetLocaleInfoA(LCID, LCTYPE, LPSTR, int);
		WINBOOL SetLocaleInfoA(LCID, LCTYPE, LPCSTR);
		int GetTimeFormatA(LCID, DWORD, LPSYSTEMTIME, LPCSTR, LPSTR, int);
		int GetDateFormatA(LCID, DWORD, LPSYSTEMTIME, LPCSTR, LPSTR, int);
		int GetNumberFormatA(LCID, DWORD, LPCSTR, PNUMBERFMT, LPSTR, int);
		int GetCurrencyFormatA(LCID, DWORD, LPCSTR, PCURRENCYFMT, LPSTR, int);
		WINBOOL EnumCalendarInfoA(CALINFO_ENUMPROC, LCID, CALID, CALTYPE);
		WINBOOL EnumTimeFormatsA(TIMEFMT_ENUMPROC, LCID, DWORD);
		WINBOOL EnumDateFormatsA(DATEFMT_ENUMPROC, LCID, DWORD);
		WINBOOL GetStringTypeExA(LCID, DWORD, LPCSTR, int, LPWORD);
		WINBOOL GetStringTypeA(LCID, DWORD, LPCSTR, int, LPWORD);
		int FoldStringA(DWORD, LPCSTR, int, LPSTR, int);
		WINBOOL EnumSystemLocalesA(LOCALE_ENUMPROC, DWORD);
		WINBOOL EnumSystemCodePagesA(CODEPAGE_ENUMPROC, DWORD);
		WINBOOL PeekConsoleInputA(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL ReadConsoleInputA(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL WriteConsoleInputA(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL ReadConsoleOutputA(HANDLE, PCHAR_INFO, COORD, COORD, PSMALL_RECT);
		WINBOOL WriteConsoleOutputA(HANDLE, PCHAR_INFO, COORD, COORD, PSMALL_RECT);
		WINBOOL ReadConsoleOutputCharacterA(HANDLE, LPSTR, DWORD, COORD, LPDWORD);
		WINBOOL WriteConsoleOutputCharacterA(HANDLE, LPCSTR, DWORD, COORD, LPDWORD);
		WINBOOL FillConsoleOutputCharacterA(HANDLE, char, DWORD, COORD, LPDWORD);
		WINBOOL ScrollConsoleScreenBufferA(HANDLE, PSMALL_RECT, PSMALL_RECT, COORD, PCHAR_INFO);
		DWORD GetConsoleTitleA(LPSTR, DWORD);
		WINBOOL SetConsoleTitleA(LPCSTR);
		WINBOOL ReadConsoleA(HANDLE, LPVOID, DWORD, LPDWORD, LPVOID);
		WINBOOL WriteConsoleA(HANDLE, POINTER, DWORD, LPDWORD, LPVOID);
		DWORD WNetAddConnectionA(LPCSTR, LPCSTR, LPCSTR);
		DWORD WNetAddConnection2A(LPNETRESOURCE, LPCSTR, LPCSTR, DWORD);
		DWORD WNetAddConnection3A(HWND, LPNETRESOURCE, LPCSTR, LPCSTR, DWORD);
		DWORD WNetCancelConnectionA(LPCSTR, WINBOOL);
		DWORD WNetCancelConnection2A(LPCSTR, DWORD, WINBOOL);
		DWORD WNetGetConnectionA(LPCSTR, LPSTR, LPDWORD);
		DWORD WNetUseConnectionA(HWND, LPNETRESOURCE, LPCSTR, LPCSTR, DWORD,
				LPSTR, LPDWORD, LPDWORD);
		DWORD WNetSetConnectionA(LPCSTR, DWORD, LPVOID);
		DWORD WNetConnectionDialog1A(LPCONNECTDLGSTRUCT);
		DWORD WNetDisconnectDialog1A(LPDISCDLGSTRUCT);
		DWORD WNetOpenEnumA(DWORD, DWORD, DWORD, LPNETRESOURCE, LPHANDLE);
		DWORD WNetEnumResourceA(HANDLE, LPDWORD, LPVOID, LPDWORD);
		DWORD WNetGetUniversalNameA(LPCSTR, DWORD, LPVOID, LPDWORD);
		DWORD WNetGetUserA(LPCSTR, LPSTR, LPDWORD);
		DWORD WNetGetProviderNameA(DWORD, LPSTR, LPDWORD);
		DWORD WNetGetNetworkInformationA(LPCSTR, LPNETINFOSTRUCT);
		DWORD WNetGetLastErrorA(LPDWORD, LPSTR, DWORD, LPSTR, DWORD);
		DWORD MultinetGetConnectionPerformanceA(LPNETRESOURCE, LPNETCONNECTINFOSTRUCT);
		WINBOOL ChangeServiceConfigA(SC_HANDLE, DWORD, DWORD, DWORD, LPCSTR,
				LPCSTR, LPDWORD, LPCSTR, LPCSTR, LPCSTR, LPCSTR);
		SC_HANDLE CreateServiceA(SC_HANDLE, LPCSTR, LPCSTR, DWORD, DWORD,
				DWORD, DWORD, LPCSTR, LPCSTR, LPDWORD, LPCSTR, LPCSTR, LPCSTR);
		WINBOOL EnumDependentServicesA(SC_HANDLE, DWORD, LPENUM_SERVICE_STATUS,
				DWORD, LPDWORD, LPDWORD);
		WINBOOL EnumServicesStatusA(SC_HANDLE, DWORD, DWORD,
				LPENUM_SERVICE_STATUS, DWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL GetServiceKeyNameA(SC_HANDLE, LPCSTR, LPSTR, LPDWORD);
		WINBOOL GetServiceDisplayNameA(SC_HANDLE, LPCSTR, LPSTR, LPDWORD);
		SC_HANDLE OpenSCManagerA(LPCSTR, LPCSTR, DWORD);
		SC_HANDLE OpenServiceA(SC_HANDLE, LPCSTR, DWORD);
		WINBOOL QueryServiceConfigA(SC_HANDLE, LPQUERY_SERVICE_CONFIG, DWORD, LPDWORD);
		WINBOOL QueryServiceLockStatusA(SC_HANDLE, LPQUERY_SERVICE_LOCK_STATUS, DWORD, LPDWORD);
		SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerA(LPCSTR, LPHANDLER_FUNCTION);
		WINBOOL StartServiceCtrlDispatcherA(LPSERVICE_TABLE_ENTRY);
		WINBOOL StartServiceA(SC_HANDLE, DWORD, LPCSTR);
		uint DragQueryFileA(HDROP, uint, PCHAR, uint);
		HICON ExtractAssociatedIconA(HINST, PCHAR, LPWORD);
		HICON ExtractIconA(HINST, PCHAR, uint);
		HINST FindExecutableA(PCHAR, PCHAR, PCHAR);
		int ShellAboutA(HWND, PCHAR, PCHAR, HICON);
		HINST ShellExecuteA(HWND, PCHAR, PCHAR, PCHAR, PCHAR, int);
		HSZ DdeCreateStringHandleA(DWORD, PCHAR, int);
		UINT DdeInitializeA(LPDWORD, PFNCALLBACK, DWORD, DWORD);
		DWORD DdeQueryStringA(DWORD, HSZ, PCHAR, DWORD, int);
		WINBOOL LogonUserA(LPSTR, LPSTR, LPSTR, DWORD, DWORD, PHANDLE);
		WINBOOL CreateProcessAsUserA(HANDLE, LPCSTR, LPSTR, LPSECURITY_ATTRIBUTES, LPSECURITY_ATTRIBUTES,
				WINBOOL, DWORD, LPVOID, LPCSTR, LPSTARTUPINFO, LPPROCESS_INFORMATION);
		WINBOOL GetBinaryTypeW(LPCWSTR, LPDWORD);
		DWORD GetShortPathNameW(LPCWSTR, LPWSTR, DWORD);
		LPWSTR GetEnvironmentStringsW();
		WINBOOL FreeEnvironmentStringsW(LPWSTR);
		DWORD FormatMessageW(DWORD, LPCVOID, DWORD, DWORD, LPWSTR, DWORD, VA_LIST*);
		HANDLE CreateMailslotW(LPCWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		int lstrcmpW(LPCWSTR, LPCWSTR);
		int lstrcmpiW(LPCWSTR, LPCWSTR);
		LPWSTR lstrcpynW(LPWSTR, LPCWSTR, int);
		LPWSTR lstrcpyW(LPWSTR, LPCWSTR);
		LPWSTR lstrcatW(LPWSTR, LPCWSTR);
		int lstrlenW(LPCWSTR);
		HANDLE CreateMutexW(LPSECURITY_ATTRIBUTES, WINBOOL, LPCWSTR);
		HANDLE OpenMutexW(DWORD, WINBOOL, LPCWSTR);
		HANDLE CreateEventW(LPSECURITY_ATTRIBUTES, WINBOOL, WINBOOL, LPCWSTR);
		HANDLE OpenEventW(DWORD, WINBOOL, LPCWSTR);
		HANDLE CreateSemaphoreW(LPSECURITY_ATTRIBUTES, LONG, LONG, LPCWSTR);
		HANDLE OpenSemaphoreW(DWORD, WINBOOL, LPCWSTR);
		HANDLE CreateFileMappingW(HANDLE, LPSECURITY_ATTRIBUTES, DWORD, DWORD, DWORD, LPCWSTR);
		HANDLE OpenFileMappingW(DWORD, WINBOOL, LPCWSTR);
		DWORD GetLogicalDriveStringsW(DWORD, LPWSTR);
		HINST LoadLibraryW(LPCWSTR);
		HINST LoadLibraryExW(LPCWSTR, HANDLE, DWORD);
		DWORD GetModuleFileNameW(HINST, LPWSTR, DWORD);
		HMODULE GetModuleHandleW(LPCWSTR);
		void FatalAppExitW(UINT);
		LPWSTR GetCommandLineW();
		DWORD GetEnvironmentVariableW(LPCWSTR, LPWSTR, DWORD);
		WINBOOL SetEnvironmentVariableW(LPCWSTR, LPCWSTR);
		DWORD ExpandEnvironmentStringsW(LPCWSTR, LPWSTR, DWORD);
		void OutputDebugStringW(LPCWSTR);
		HRSRC FindResourceW(HINST, LPCWSTR, LPCWSTR);
		HRSRC FindResourceExW(HINST, LPCWSTR, LPCWSTR, ushort);
		WINBOOL EnumResourceTypesW(HINST, ENUMRESTYPEPROC, LONG_PTR);
		WINBOOL EnumResourceNamesW(HINST, LPCWSTR, ENUMRESNAMEPROC, LONG_PTR);
		WINBOOL EnumResourceLanguagesW(HINST, LPCWSTR, LPCWSTR, ENUMRESLANGPROC, LONG_PTR);
		HANDLE BeginUpdateResourceW(LPCWSTR, WINBOOL);
		WINBOOL UpdateResourceW(HANDLE, LPCWSTR, LPCWSTR, ushort, LPVOID, DWORD);
		WINBOOL EndUpdateResourceW(HANDLE, WINBOOL);
		ATOM GlobalAddAtomW(LPCWSTR);
		ATOM GlobalFindAtomW(LPCWSTR);
		UINT GlobalGetAtomNameW(ATOM, LPWSTR, int);
		ATOM AddAtomW(LPCWSTR);
		ATOM FindAtomW(LPCWSTR);
		UINT GetAtomNameW(ATOM, LPWSTR, int);
		UINT GetProfileIntW(LPCWSTR, LPCWSTR, INT);
		DWORD GetProfileStringW(LPCWSTR, LPCWSTR, LPCWSTR, LPWSTR, DWORD);
		WINBOOL WriteProfileStringW(LPCWSTR, LPCWSTR, LPCWSTR);
		DWORD GetProfileSectionW(LPCWSTR, LPWSTR, DWORD);
		WINBOOL WriteProfileSectionW(LPCWSTR, LPCWSTR);
		UINT GetPrivateProfileIntW(LPCWSTR, LPCWSTR, INT, LPCWSTR);
		DWORD GetPrivateProfileStringW(LPCWSTR, LPCWSTR, LPCWSTR, LPWSTR, DWORD, LPCWSTR);
		WINBOOL WritePrivateProfileStringW(LPCWSTR, LPCWSTR, LPCWSTR, LPCWSTR);
		DWORD GetPrivateProfileSectionW(LPCWSTR, LPWSTR, DWORD, LPCWSTR);
		WINBOOL WritePrivateProfileSectionW(LPCWSTR, LPCWSTR, LPCWSTR);
		UINT GetDriveTypeW(LPCWSTR);
		UINT GetSystemDirectoryW(LPWSTR, UINT);
		DWORD GetTempPathW(DWORD, LPWSTR);
		UINT GetTempFileNameW(LPCWSTR, LPCWSTR, UINT, LPWSTR);
		UINT GetWindowsDirectoryW(LPWSTR, UINT);
		WINBOOL SetCurrentDirectoryW(LPCWSTR);
		DWORD GetCurrentDirectoryW(DWORD, LPWSTR);
		WINBOOL GetDiskFreeSpaceW(LPCWSTR, LPDWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL CreateDirectoryW(LPCWSTR, LPSECURITY_ATTRIBUTES);
		WINBOOL CreateDirectoryExW(LPCWSTR, LPCWSTR, LPSECURITY_ATTRIBUTES);
		WINBOOL RemoveDirectoryW(LPCWSTR);
		DWORD GetFullPathNameW(LPCWSTR, DWORD, LPWSTR, LPWSTR*);
		WINBOOL DefineDosDeviceW(DWORD, LPCWSTR, LPCWSTR);
		DWORD QueryDosDeviceW(LPCWSTR, LPWSTR, DWORD);
		HANDLE CreateFileW(LPCWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES, DWORD, DWORD, HANDLE);
		WINBOOL SetFileAttributesW(LPCWSTR, DWORD);
		DWORD GetFileAttributesW(LPCWSTR);
		BOOL GetFileAttributesExW(LPCWSTR, DWORD, WIN32_FILE_ATTRIBUTE_DATA*);
		DWORD GetCompressedFileSizeW(LPCWSTR, LPDWORD);
		WINBOOL DeleteFileW(LPCWSTR);
		DWORD SearchPathW(LPCWSTR, LPCWSTR, LPCWSTR, DWORD, LPWSTR, LPWSTR);
		WINBOOL CopyFileW(LPCWSTR, LPCWSTR, WINBOOL);
		WINBOOL MoveFileW(LPCWSTR, LPCWSTR);
		WINBOOL MoveFileExW(LPCWSTR, LPCWSTR, DWORD);
		HANDLE CreateNamedPipeW(LPCWSTR, DWORD, DWORD, DWORD, DWORD, DWORD,
				DWORD, LPSECURITY_ATTRIBUTES);
		WINBOOL GetNamedPipeHandleStateW(HANDLE, LPDWORD, LPDWORD, LPDWORD,
				LPDWORD, LPWSTR, DWORD);
		WINBOOL CallNamedPipeW(LPCWSTR, LPVOID, DWORD, LPVOID, DWORD, LPDWORD, DWORD);
		WINBOOL WaitNamedPipeW(LPCWSTR, DWORD);
		WINBOOL SetVolumeLabelW(LPCWSTR, LPCWSTR);
		WINBOOL GetVolumeInformationW(LPCWSTR, LPWSTR, DWORD, LPDWORD, LPDWORD,
				LPDWORD, LPWSTR, DWORD);
		WINBOOL ClearEventLogW(HANDLE, LPCWSTR);
		WINBOOL BackupEventLogW(HANDLE, LPCWSTR);
		HANDLE OpenEventLogW(LPCWSTR, LPCWSTR);
		HANDLE RegisterEventSourceW(LPCWSTR, LPCWSTR);
		HANDLE OpenBackupEventLogW(LPCWSTR, LPCWSTR);
		WINBOOL ReadEventLogW(HANDLE, DWORD, DWORD, LPVOID, DWORD, LPDWORD, LPDWORD);
		WINBOOL ReportEventW(HANDLE, ushort, ushort, DWORD, PSID, ushort,
				DWORD, LPCWSTR*, LPVOID);
		WINBOOL AccessCheckAndAuditAlarmW(LPCWSTR, LPVOID, LPWSTR, LPWSTR,
				PSECURITY_DESCRIPTOR, DWORD, PGENERIC_MAPPING, WINBOOL, LPDWORD, LPBOOL, LPBOOL);
		WINBOOL ObjectOpenAuditAlarmW(LPCWSTR, LPVOID, LPWSTR, LPWSTR, PSECURITY_DESCRIPTOR,
				HANDLE, DWORD, DWORD, PPRIVILEGE_SET, WINBOOL, WINBOOL, LPBOOL);
		WINBOOL ObjectPrivilegeAuditAlarmW(LPCWSTR, LPVOID, HANDLE, DWORD,
				PPRIVILEGE_SET, WINBOOL);
		WINBOOL ObjectCloseAuditAlarmW(LPCWSTR, LPVOID, WINBOOL);
		WINBOOL PrivilegedServiceAuditAlarmW(LPCWSTR, LPCWSTR, HANDLE, PPRIVILEGE_SET, WINBOOL);
		WINBOOL SetFileSecurityW(LPCWSTR, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		WINBOOL GetFileSecurityW(LPCWSTR, SECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, DWORD, LPDWORD);
		HANDLE FindFirstChangeNotificationW(LPCWSTR, WINBOOL, DWORD);
		WINBOOL IsBadStringPtrW(LPCWSTR, UINT_PTR);
		WINBOOL LookupAccountSidW(LPCWSTR, PSID, LPWSTR, LPDWORD, LPWSTR, LPDWORD, PSID_NAME_USE);
		WINBOOL LookupAccountNameW(LPCWSTR, LPCWSTR, PSID, LPDWORD, LPWSTR,
				LPDWORD, PSID_NAME_USE);
		WINBOOL LookupPrivilegeValueW(LPCWSTR, LPCWSTR, PLUID);
		WINBOOL LookupPrivilegeNameW(LPCWSTR, PLUID, LPWSTR, LPDWORD);
		WINBOOL LookupPrivilegeDisplayNameW(LPCWSTR, LPCWSTR, LPWSTR, LPDWORD, LPDWORD);
		WINBOOL BuildCommDCBW(LPCWSTR, LPDCB);
		WINBOOL BuildCommDCBAndTimeoutsW(LPCWSTR, LPDCB, LPCOMMTIMEOUTS);
		WINBOOL CommConfigDialogW(LPCWSTR, HWND, LPCOMMCONFIG);
		WINBOOL GetDefaultCommConfigW(LPCWSTR, LPCOMMCONFIG, LPDWORD);
		WINBOOL SetDefaultCommConfigW(LPCWSTR, LPCOMMCONFIG, DWORD);
		WINBOOL GetComputerNameW(LPWSTR, LPDWORD);
		WINBOOL SetComputerNameW(LPCWSTR);
		WINBOOL GetUserNameW(LPWSTR, LPDWORD);
		int wvsprintfW(LPWSTR, LPCWSTR, VA_LIST*);
		HKL LoadKeyboardLayoutW(LPCWSTR, UINT);
		WINBOOL GetKeyboardLayoutNameW(LPWSTR);
		HDESK CreateDesktopW(LPWSTR, LPWSTR, LPDEVMODE, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		HDESK OpenDesktopW(LPWSTR, DWORD, WINBOOL, DWORD);
		WINBOOL EnumDesktopsW(HWINSTA, DESKTOPENUMPROC, LPARAM);
		HWINSTA CreateWindowStationW(LPWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES);
		HWINSTA OpenWindowStationW(LPWSTR, WINBOOL, DWORD);
		WINBOOL EnumWindowStationsW(ENUMWINDOWSTATIONPROC, LPARAM);
		WINBOOL GetUserObjectInformationW(HANDLE, int, PVOID, DWORD, LPDWORD);
		WINBOOL SetUserObjectInformationW(HANDLE, int, PVOID, DWORD);
		UINT RegisterWindowMessageW(LPCWSTR);
		WINBOOL GetMessageW(LPMSG, HWND, UINT, UINT);
		LONG DispatchMessageW(LPMSG);
		WINBOOL PeekMessageW(LPMSG, HWND, UINT, UINT, UINT);
		LRESULT SendMessageW(HWND, UINT, WPARAM, LPARAM);
		LRESULT SendMessageW(HWND, UINT, WPARAM, void*);
		LRESULT SendMessageW(HWND, UINT, void*, LPARAM);
		LRESULT SendMessageW(HWND, UINT, void*, void*);
		LRESULT SendMessageTimeoutW(HWND, UINT, WPARAM, LPARAM, UINT, UINT, PDWORD_PTR);
		WINBOOL SendNotifyMessageW(HWND, UINT, WPARAM, LPARAM);
		WINBOOL SendMessageCallbackW(HWND, UINT, WPARAM, LPARAM, SENDASYNCPROC, ULONG_PTR);
		WINBOOL PostMessageW(HWND, UINT, WPARAM, LPARAM);
		WINBOOL PostThreadMessageW(DWORD, UINT, WPARAM, LPARAM);
		LRESULT DefWindowProcW(HWND, UINT, WPARAM, LPARAM);
		LRESULT CallWindowProcW(WNDPROC, HWND, UINT, WPARAM, LPARAM);
		ATOM RegisterClassW(LPWNDCLASSW);
		WINBOOL UnregisterClassW(LPCWSTR, HINST);
		WINBOOL GetClassInfoW(HINST, LPCWSTR, LPWNDCLASS);
		ATOM RegisterClassExW(LPWNDCLASSEX);
		WINBOOL GetClassInfoExW(HINST, LPCWSTR, LPWNDCLASSEX);
		HWND CreateWindowExW(DWORD, LPCWSTR, LPCWSTR, DWORD, int, int, int,
				int, HWND, HMENU, HINST, LPVOID);
		HWND CreateDialogParamW(HINST, LPCWSTR, HWND, DLGPROC, LPARAM);
		HWND CreateDialogIndirectParamW(HINST, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
		INT_PTR DialogBoxParamW(HINST, LPCWSTR, HWND, DLGPROC, LPARAM);
		INT_PTR DialogBoxIndirectParamW(HINST, LPCDLGTEMPLATE, HWND, DLGPROC, LPARAM);
		WINBOOL SetDlgItemTextW(HWND, int, LPCWSTR);
		UINT GetDlgItemTextW(HWND, int, LPWSTR, int);
		LONG SendDlgItemMessageW(HWND, int, UINT, WPARAM, LPARAM);
		LRESULT DefDlgProcW(HWND, UINT, WPARAM, LPARAM);
		WINBOOL CallMsgFilterW(LPMSG, int);
		UINT RegisterClipboardFormatW(LPCWSTR);
		int GetClipboardFormatNameW(UINT, LPWSTR, int);
		WINBOOL CharToOemW(LPCWSTR, LPSTR);
		WINBOOL OemToCharW(LPCSTR, LPWSTR);
		WINBOOL CharToOemBuffW(LPCWSTR, LPSTR, DWORD);
		WINBOOL OemToCharBuffW(LPCSTR, LPWSTR, DWORD);
		LPWSTR CharUpperW(LPWSTR);
		DWORD CharUpperBuffW(LPWSTR, DWORD);
		LPWSTR CharLowerW(LPWSTR);
		DWORD CharLowerBuffW(LPWSTR, DWORD);
		LPWSTR CharNextW(LPCWSTR);
		LPWSTR CharPrevW(LPCWSTR, LPCWSTR);
		WINBOOL IsCharAlphaW(WCHAR);
		WINBOOL IsCharAlphaNumericW(WCHAR);
		WINBOOL IsCharUpperW(WCHAR);
		WINBOOL IsCharLowerW(WCHAR);
		int GetKeyNameTextW(LONG, LPWSTR, int);
		SHORT VkKeyScanW(WCHAR);
		SHORT VkKeyScanExW(WCHAR, HKL);
		UINT MapVirtualKeyW(UINT, UINT);
		UINT MapVirtualKeyExW(UINT, UINT, HKL);
		HACCEL LoadAcceleratorsW(HINST, LPCWSTR);
		HACCEL CreateAcceleratorTableW(LPACCEL, int);
		int CopyAcceleratorTableW(HACCEL, LPACCEL, int);
		int TranslateAcceleratorW(HWND, HACCEL, LPMSG);
		HMENU LoadMenuW(HINST, LPCWSTR);
		HMENU LoadMenuIndirectW(LPMENUTEMPLATE);
		WINBOOL ChangeMenuW(HMENU, UINT, LPCWSTR, UINT, UINT);
		int GetMenuStringW(HMENU, UINT, LPWSTR, int, UINT);
		WINBOOL InsertMenuW(HMENU, UINT, UINT, UINT_PTR, LPCWSTR);
		WINBOOL AppendMenuW(HMENU, UINT, UINT_PTR, LPCWSTR);
		WINBOOL ModifyMenuW(HMENU, UINT, UINT, UINT_PTR, LPCWSTR);
		WINBOOL InsertMenuItemW(HMENU, UINT, WINBOOL, LPCMENUITEMINFO);
		WINBOOL GetMenuItemInfoW(HMENU, UINT, WINBOOL, LPMENUITEMINFO);
		WINBOOL SetMenuItemInfoW(HMENU, UINT, WINBOOL, LPCMENUITEMINFO);
		int DrawTextW(HDC, LPCWSTR, int, LPRECT, UINT);
		int DrawTextExW(HDC, LPWSTR, int, LPRECT, UINT, LPDRAWTEXTPARAMS);
		WINBOOL GrayStringW(HDC, HBRUSH, GRAYSTRINGPROC, LPARAM, int, int, int, int, int);
		WINBOOL DrawStateW(HDC, HBRUSH, DRAWSTATEPROC, LPARAM, WPARAM, int, int, int, int, UINT);
		LONG TabbedTextOutW(HDC, int, int, LPCWSTR, int, int, LPINT, int);
		DWORD GetTabbedTextExtentW(HDC, LPCWSTR, int, int, LPINT);
		WINBOOL SetPropW(HWND, LPCWSTR, HANDLE);
		HANDLE GetPropW(HWND, LPCWSTR);
		HANDLE RemovePropW(HWND, LPCWSTR);
		int EnumPropsExW(HWND, PROPENUMPROCEX, LPARAM);
		int EnumPropsW(HWND, PROPENUMPROC);
		WINBOOL SetWindowTextW(HWND, LPCWSTR);
		int GetWindowTextW(HWND, LPWSTR, int);
		int GetWindowTextLengthW(HWND);
		int MessageBoxW(HWND, LPCWSTR, LPCWSTR, UINT);
		int MessageBoxExW(HWND, LPCWSTR, LPCWSTR, UINT, ushort);
		int MessageBoxIndirectW(LPMSGBOXPARAMS);
		LONG SetWindowLongW(HWND, int, LONG);
		LONG GetWindowLongW(HWND, int);
		version (Win32) {
			alias SetWindowLongPtrW = SetWindowLongW;
			alias GetWindowLongPtrW = GetWindowLongW;
		}
		else {
			LONG_PTR SetWindowLongPtrW(HWND, int, LONG_PTR);
			LONG_PTR GetWindowLongPtrW(HWND, int);
		}
		DWORD GetClassLongW(HWND, int);
		DWORD SetClassLongW(HWND, int, LONG);
		HWND FindWindowW(LPCWSTR, LPCWSTR);
		HWND FindWindowExW(HWND, HWND, LPCWSTR, LPCWSTR);
		int GetClassNameW(HWND, LPWSTR, int);
		HHOOK SetWindowsHookExW(int, HOOKPROC, HINST, DWORD);
		HBITMAP LoadBitmapW(HINST, LPCWSTR);
		HCURSOR LoadCursorW(HINST, LPCWSTR);
		HCURSOR LoadCursorFromFileW(LPCWSTR);
		HICON LoadIconW(HINST, LPCWSTR);
		HANDLE LoadImageW(HINST, LPCWSTR, UINT, int, int, UINT);
		int LoadStringW(HINST, UINT, LPWSTR, int);
		WINBOOL IsDialogMessageW(HWND, LPMSG);
		int DlgDirListW(HWND, LPWSTR, int, int, UINT);
		WINBOOL DlgDirSelectExW(HWND, LPWSTR, int, int);
		int DlgDirListComboBoxW(HWND, LPWSTR, int, int, UINT);
		WINBOOL DlgDirSelectComboBoxExW(HWND, LPWSTR, int, int);
		LRESULT DefFrameProcW(HWND, HWND, UINT, WPARAM, LPARAM);
		LRESULT DefMDIChildProcW(HWND, UINT, WPARAM, LPARAM);
		HWND CreateMDIWindowW(LPWSTR, LPWSTR, DWORD, int, int, int, int, HWND, HINST, LPARAM);
		WINBOOL WinHelpW(HWND, LPCWSTR, UINT, ULONG_PTR);
		LONG ChangeDisplaySettingsW(LPDEVMODE, DWORD);
		WINBOOL EnumDisplaySettingsW(LPCWSTR, DWORD, LPDEVMODE);
		WINBOOL SystemParametersInfoW(UINT, UINT, PVOID, UINT);
		int AddFontResourceW(LPCWSTR);
		HMETAFILE CopyMetaFileW(HMETAFILE, LPCWSTR);
		HFONT CreateFontIndirectW(PLOGFONT);
		HFONT CreateFontW(int, int, int, int, int, DWORD, DWORD, DWORD, DWORD,
				DWORD, DWORD, DWORD, DWORD, LPCWSTR);
		HDC CreateICW(LPCWSTR, LPCWSTR, LPCWSTR, LPDEVMODE);
		HDC CreateMetaFileW(LPCWSTR);
		WINBOOL CreateScalableFontResourceW(DWORD, LPCWSTR, LPCWSTR, LPCWSTR);
		int EnumFontFamiliesExW(HDC, LPLOGFONT, FONTENUMEXPROC, LPARAM, DWORD);
		int EnumFontFamiliesW(HDC, LPCWSTR, FONTENUMPROC, LPARAM);
		int EnumFontsW(HDC, LPCWSTR, ENUMFONTSPROC, LPARAM);
		WINBOOL GetCharWidthW(HDC, UINT, UINT, LPINT);
		WINBOOL GetCharWidth32W(HDC, UINT, UINT, LPINT);
		WINBOOL GetCharWidthFloatW(HDC, UINT, UINT, PFLOAT);
		WINBOOL GetCharABCWidthsW(HDC, UINT, UINT, LPABC);
		WINBOOL GetCharABCWidthsFloatW(HDC, UINT, UINT, LPABCFLOAT);
		DWORD GetGlyphOutlineW(HDC, UINT, UINT, LPGLYPHMETRICS, DWORD, LPVOID, PMAT2);
		HMETAFILE GetMetaFileW(LPCWSTR);
		UINT GetOutlineTextMetricsW(HDC, UINT, LPOUTLINETEXTMETRIC);
		WINBOOL GetTextExtentPointW(HDC, LPCWSTR, int, LPSIZE);
		WINBOOL GetTextExtentPoint32W(HDC, LPCWSTR, int, LPSIZE);
		WINBOOL GetTextExtentExPointW(HDC, LPCWSTR, int, int, LPINT, LPINT, LPSIZE);
		DWORD GetCharacterPlacementW(HDC, LPCWSTR, int, int, LPGCP_RESULTS, DWORD);
		HDC ResetDCW(HDC, LPDEVMODE);
		WINBOOL RemoveFontResourceW(LPCWSTR);
		HENHMETAFILE CopyEnhMetaFileW(HENHMETAFILE, LPCWSTR);
		HDC CreateEnhMetaFileW(HDC, LPCWSTR, LPRECT, LPCWSTR);
		HENHMETAFILE GetEnhMetaFileW(LPCWSTR);
		UINT GetEnhMetaFileDescriptionW(HENHMETAFILE, UINT, LPWSTR);
		WINBOOL GetTextMetricsW(HDC, LPTEXTMETRIC);
		int StartDocW(HDC, PDOCINFO);
		int GetObjectW(HGDIOBJ, int, LPVOID);
		WINBOOL TextOutW(HDC, int, int, LPCWSTR, int);
		WINBOOL ExtTextOutW(HDC, int, int, UINT, LPRECT, LPCWSTR, UINT, LPINT);
		WINBOOL PolyTextOutW(HDC, PPOLYTEXT, int);
		int GetTextFaceW(HDC, int, LPWSTR);
		DWORD GetKerningPairsW(HDC, DWORD, LPKERNINGPAIR);
		WINBOOL GetLogColorSpaceW(HCOLORSPACE, LPLOGCOLORSPACE, DWORD);
		HCOLORSPACE CreateColorSpaceW(LPLOGCOLORSPACE);
		WINBOOL GetICMProfileW(HDC, DWORD, LPWSTR);
		WINBOOL SetICMProfileW(HDC, LPWSTR);
		WINBOOL UpdateICMRegKeyW(DWORD, DWORD, LPWSTR, UINT);
		int EnumICMProfilesW(HDC, ICMENUMPROC, LPARAM);
		HPROPSHEETPAGE CreatePropertySheetPageW(LPCPROPSHEETPAGE);
		INT_PTR PropertySheetW(LPCPROPSHEETHEADER);
		HIMAGELIST ImageList_LoadImageW(HINST, LPCWSTR, int, int, COLORREF, UINT, UINT);
		HWND CreateStatusWindowW(LONG, LPCWSTR, HWND, UINT);
		void DrawStatusTextW(HDC, LPRECT, LPCWSTR);
		WINBOOL GetOpenFileNameW(LPOPENFILENAME);
		WINBOOL GetSaveFileNameW(LPOPENFILENAME);
		int GetFileTitleW(LPCWSTR, LPWSTR, ushort);
		WINBOOL ChooseColorW(LPCHOOSECOLOR);
		HWND ReplaceTextW(LPFINDREPLACE);
		WINBOOL ChooseFontW(LPCHOOSEFONTW);
		HWND FindTextW(LPFINDREPLACE);
		WINBOOL PrintDlgW(LPPRINTDLGW);
		WINBOOL PageSetupDlgW(LPPAGESETUPDLG);
		WINBOOL CreateProcessW(LPCWSTR, LPWSTR, LPSECURITY_ATTRIBUTES, LPSECURITY_ATTRIBUTES,
				WINBOOL, DWORD, LPVOID, LPCWSTR, LPSTARTUPINFO, LPPROCESS_INFORMATION);
		void GetStartupInfoW(LPSTARTUPINFO);
		HANDLE FindFirstFileW(LPCWSTR, LPWIN32_FIND_DATAW);
		WINBOOL FindNextFileW(HANDLE, LPWIN32_FIND_DATAW);
		WINBOOL GetVersionExW(LPOSVERSIONINFO);
		HDC CreateDCW(LPCWSTR, LPCWSTR, LPCWSTR, PDEVMODE);
		HFONT CreateFontA(int, int, int, int, int, DWORD, DWORD, DWORD, DWORD,
				DWORD, DWORD, DWORD, DWORD, LPCSTR);
		DWORD VerInstallFileW(DWORD, LPWSTR, LPWSTR, LPWSTR, LPWSTR, LPWSTR, LPWSTR, PUINT);
		DWORD GetFileVersionInfoSizeW(LPWSTR, LPDWORD);
		WINBOOL GetFileVersionInfoW(LPWSTR, DWORD, DWORD, LPVOID);
		DWORD VerLanguageNameW(DWORD, LPWSTR, DWORD);
		WINBOOL VerQueryValueW(LPVOID, LPWSTR, LPVOID, PUINT);
		DWORD VerFindFileW(DWORD, LPWSTR, LPWSTR, LPWSTR, LPWSTR, PUINT, LPWSTR, PUINT);
		LONG RegSetValueExW(HKEY, LPCWSTR, DWORD, DWORD, LPBYTE, DWORD);
		LONG RegUnLoadKeyW(HKEY, LPCWSTR);
		WINBOOL InitiateSystemShutdownW(LPWSTR, LPWSTR, DWORD, WINBOOL, WINBOOL);
		WINBOOL AbortSystemShutdownW(LPWSTR);
		LONG RegRestoreKeyW(HKEY, LPCWSTR, DWORD);
		LONG RegSaveKeyW(HKEY, LPCWSTR, LPSECURITY_ATTRIBUTES);
		LONG RegSetValueW(HKEY, LPCWSTR, DWORD, LPCWSTR, DWORD);
		LONG RegQueryValueW(HKEY, LPCWSTR, LPWSTR, PLONG);
		LONG RegQueryMultipleValuesW(HKEY, PVALENT, DWORD, LPWSTR, LPDWORD);
		LONG RegQueryValueExW(HKEY, LPCWSTR, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
		LONG RegReplaceKeyW(HKEY, LPCWSTR, LPCWSTR, LPCWSTR);
		LONG RegConnectRegistryW(LPWSTR, HKEY, PHKEY);
		LONG RegCreateKeyW(HKEY, LPCWSTR, PHKEY);
		LONG RegCreateKeyExW(HKEY, LPCWSTR, DWORD, LPWSTR, DWORD, REGSAM,
				LPSECURITY_ATTRIBUTES, PHKEY, LPDWORD);
		LONG RegDeleteKeyW(HKEY, LPCWSTR);
		LONG RegDeleteValueW(HKEY, LPCWSTR);
		LONG RegEnumKeyW(HKEY, DWORD, LPWSTR, DWORD);
		LONG RegEnumKeyExW(HKEY, DWORD, LPWSTR, LPDWORD, LPDWORD, LPWSTR, LPDWORD, PFILETIME);
		LONG RegEnumValueW(HKEY, DWORD, LPWSTR, LPDWORD, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
		LONG RegLoadKeyW(HKEY, LPCWSTR, LPCWSTR);
		LONG RegOpenKeyW(HKEY, LPCWSTR, PHKEY);
		LONG RegOpenKeyExW(HKEY, LPCWSTR, DWORD, REGSAM, PHKEY);
		LONG RegQueryInfoKeyW(HKEY, LPWSTR, LPDWORD, LPDWORD, LPDWORD, LPDWORD,
				LPDWORD, LPDWORD, LPDWORD, LPDWORD, LPDWORD, PFILETIME);
		int CompareStringW(LCID, DWORD, LPCWSTR, int, LPCWSTR, int);
		int LCMapStringW(LCID, DWORD, LPCWSTR, int, LPWSTR, int);
		int GetLocaleInfoW(LCID, LCTYPE, LPWSTR, int);
		WINBOOL SetLocaleInfoW(LCID, LCTYPE, LPCWSTR);
		int GetTimeFormatW(LCID, DWORD, LPSYSTEMTIME, LPCWSTR, LPWSTR, int);
		int GetDateFormatW(LCID, DWORD, LPSYSTEMTIME, LPCWSTR, LPWSTR, int);
		int GetNumberFormatW(LCID, DWORD, LPCWSTR, PNUMBERFMT, LPWSTR, int);
		int GetCurrencyFormatW(LCID, DWORD, LPCWSTR, PCURRENCYFMT, LPWSTR, int);
		WINBOOL EnumCalendarInfoW(CALINFO_ENUMPROC, LCID, CALID, CALTYPE);
		WINBOOL EnumTimeFormatsW(TIMEFMT_ENUMPROC, LCID, DWORD);
		WINBOOL EnumDateFormatsW(DATEFMT_ENUMPROC, LCID, DWORD);
		WINBOOL GetStringTypeExW(LCID, DWORD, LPCWSTR, int, LPWORD);
		WINBOOL GetStringTypeW(DWORD, LPCWSTR, int, LPWORD);
		int FoldStringW(DWORD, LPCWSTR, int, LPWSTR, int);
		WINBOOL EnumSystemLocalesW(LOCALE_ENUMPROC, DWORD);
		WINBOOL EnumSystemCodePagesW(CODEPAGE_ENUMPROC, DWORD);
		WINBOOL PeekConsoleInputW(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL ReadConsoleInputW(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL WriteConsoleInputW(HANDLE, PINPUTRECORD, DWORD, LPDWORD);
		WINBOOL ReadConsoleOutputW(HANDLE, PCHAR_INFO, COORD, COORD, PSMALL_RECT);
		WINBOOL WriteConsoleOutputW(HANDLE, PCHAR_INFO, COORD, COORD, PSMALL_RECT);
		WINBOOL ReadConsoleOutputCharacterW(HANDLE, LPWSTR, DWORD, COORD, LPDWORD);
		WINBOOL WriteConsoleOutputCharacterW(HANDLE, LPCWSTR, DWORD, COORD, LPDWORD);
		WINBOOL FillConsoleOutputCharacterW(HANDLE, WCHAR, DWORD, COORD, LPDWORD);
		WINBOOL ScrollConsoleScreenBufferW(HANDLE, PSMALL_RECT, PSMALL_RECT, COORD, PCHAR_INFO);
		DWORD GetConsoleTitleW(LPWSTR, DWORD);
		WINBOOL SetConsoleTitleW(LPCWSTR);
		WINBOOL ReadConsoleW(HANDLE, LPVOID, DWORD, LPDWORD, LPVOID);
		WINBOOL WriteConsoleW(HANDLE, POINTER, DWORD, LPDWORD, LPVOID);
		DWORD WNetAddConnectionW(LPCWSTR, LPCWSTR, LPCWSTR);
		DWORD WNetAddConnection2W(LPNETRESOURCE, LPCWSTR, LPCWSTR, DWORD);
		DWORD WNetAddConnection3W(HWND, LPNETRESOURCE, LPCWSTR, LPCWSTR, DWORD);
		DWORD WNetCancelConnectionW(LPCWSTR, WINBOOL);
		DWORD WNetCancelConnection2W(LPCWSTR, DWORD, WINBOOL);
		DWORD WNetGetConnectionW(LPCWSTR, LPWSTR, LPDWORD);
		DWORD WNetUseConnectionW(HWND, LPNETRESOURCE, LPCWSTR, LPCWSTR, DWORD,
				LPWSTR, LPDWORD, LPDWORD);
		DWORD WNetSetConnectionW(LPCWSTR, DWORD, LPVOID);
		DWORD WNetConnectionDialog1W(LPCONNECTDLGSTRUCT);
		DWORD WNetDisconnectDialog1W(LPDISCDLGSTRUCT);
		DWORD WNetOpenEnumW(DWORD, DWORD, DWORD, LPNETRESOURCE, LPHANDLE);
		DWORD WNetEnumResourceW(HANDLE, LPDWORD, LPVOID, LPDWORD);
		DWORD WNetGetUniversalNameW(LPCWSTR, DWORD, LPVOID, LPDWORD);
		DWORD WNetGetUserW(LPCWSTR, LPWSTR, LPDWORD);
		DWORD WNetGetProviderNameW(DWORD, LPWSTR, LPDWORD);
		DWORD WNetGetNetworkInformationW(LPCWSTR, LPNETINFOSTRUCT);
		DWORD WNetGetLastErrorW(LPDWORD, LPWSTR, DWORD, LPWSTR, DWORD);
		DWORD MultinetGetConnectionPerformanceW(LPNETRESOURCE, LPNETCONNECTINFOSTRUCT);
		WINBOOL ChangeServiceConfigW(SC_HANDLE, DWORD, DWORD, DWORD, LPCWSTR,
				LPCWSTR, LPDWORD, LPCWSTR, LPCWSTR, LPCWSTR, LPCWSTR);
		SC_HANDLE CreateServiceW(SC_HANDLE, LPCWSTR, LPCWSTR, DWORD, DWORD,
				DWORD, DWORD, LPCWSTR, LPCWSTR, LPDWORD, LPCWSTR, LPCWSTR, LPCWSTR);
		WINBOOL EnumDependentServicesW(SC_HANDLE, DWORD, LPENUM_SERVICE_STATUS,
				DWORD, LPDWORD, LPDWORD);
		WINBOOL EnumServicesStatusW(SC_HANDLE, DWORD, DWORD,
				LPENUM_SERVICE_STATUS, DWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL GetServiceKeyNameW(SC_HANDLE, LPCWSTR, LPWSTR, LPDWORD);
		WINBOOL GetServiceDisplayNameW(SC_HANDLE, LPCWSTR, LPWSTR, LPDWORD);
		SC_HANDLE OpenSCManagerW(LPCWSTR, LPCWSTR, DWORD);
		SC_HANDLE OpenServiceW(SC_HANDLE, LPCWSTR, DWORD);
		WINBOOL QueryServiceConfigW(SC_HANDLE, LPQUERY_SERVICE_CONFIG, DWORD, LPDWORD);
		WINBOOL QueryServiceLockStatusW(SC_HANDLE, LPQUERY_SERVICE_LOCK_STATUS, DWORD, LPDWORD);
		SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerW(LPCWSTR, LPHANDLER_FUNCTION);
		WINBOOL StartServiceCtrlDispatcherW(LPSERVICE_TABLE_ENTRY);
		WINBOOL StartServiceW(SC_HANDLE, DWORD, LPCWSTR);
		uint DragQueryFileW(HDROP, uint, LPCWSTR, uint);
		HICON ExtractAssociatedIconW(HINST, LPCWSTR, LPWORD);
		HICON ExtractIconW(HINST, LPCWSTR, uint);
		HINST FindExecutableW(LPCWSTR, LPCWSTR, LPCWSTR);
		int ShellAboutW(HWND, LPCWSTR, LPCWSTR, HICON);
		HINST ShellExecuteW(HWND, LPCWSTR, LPCWSTR, LPCWSTR, LPCWSTR, int);
		HSZ DdeCreateStringHandleW(DWORD, LPCWSTR, int);
		UINT DdeInitializeW(LPDWORD, PFNCALLBACK, DWORD, DWORD);
		DWORD DdeQueryStringW(DWORD, HSZ, LPCWSTR, DWORD, int);
		WINBOOL LogonUserW(LPWSTR, LPWSTR, LPWSTR, DWORD, DWORD, PHANDLE);
		WINBOOL CreateProcessAsUserW(HANDLE, LPCWSTR, LPWSTR, LPSECURITY_ATTRIBUTES, LPSECURITY_ATTRIBUTES,
				WINBOOL, DWORD, LPVOID, LPCWSTR, LPSTARTUPINFO, LPPROCESS_INFORMATION);
		WINBOOL AccessCheck(PSECURITY_DESCRIPTOR, HANDLE, DWORD,
				PGENERIC_MAPPING, PPRIVILEGE_SET, LPDWORD, LPDWORD, LPBOOL);
		LONG InterlockedIncrement(LPLONG);
		LONG InterlockedDecrement(LPLONG);
		LONG InterlockedExchange(LPLONG, LONG);
		WINBOOL FreeResource(HGLOBAL);
		LPVOID LockResource(HGLOBAL);
		WINBOOL FreeLibrary(HINST);
		void FreeLibraryAndExitThread(HMODULE, DWORD);
		WINBOOL DisableThreadLibraryCalls(HMODULE);
		FARPROC GetProcAddress(HINST, LPCSTR);
		DWORD GetVersion();
		HGLOBAL GlobalAlloc(UINT, SIZE_T);
		HGLOBAL GlobalReAlloc(HGLOBAL, SIZE_T, UINT);
		SIZE_T GlobalSize(HGLOBAL);
		UINT GlobalFlags(HGLOBAL);
		LPVOID GlobalLock(HGLOBAL);
		HGLOBAL GlobalHandle(LPCVOID);
		WINBOOL GlobalUnlock(HGLOBAL);
		HGLOBAL GlobalFree(HGLOBAL);
		SIZE_T GlobalCompact(DWORD);
		void GlobalFix(HGLOBAL);
		void GlobalUnfix(HGLOBAL);
		LPVOID GlobalWire(HGLOBAL);
		WINBOOL GlobalUnWire(HGLOBAL);
		void GlobalMemoryStatus(LPMEMORYSTATUS);
		HLOCAL LocalAlloc(UINT, SIZE_T);
		HLOCAL LocalReAlloc(HLOCAL, SIZE_T, UINT);
		LPVOID LocalLock(HLOCAL);
		HLOCAL LocalHandle(LPCVOID);
		WINBOOL LocalUnlock(HLOCAL);
		SIZE_T LocalSize(HLOCAL);
		UINT LocalFlags(HLOCAL);
		HLOCAL LocalFree(HLOCAL);
		SIZE_T LocalShrink(HLOCAL, UINT);
		SIZE_T LocalCompact(UINT);
		WINBOOL FlushInstructionCache(HANDLE, LPCVOID, SIZE_T);
		LPVOID VirtualAlloc(LPVOID, SIZE_T, DWORD, DWORD);
		WINBOOL VirtualFree(LPVOID, SIZE_T, DWORD);
		WINBOOL VirtualProtect(LPVOID, SIZE_T, DWORD, PDWORD);
		DWORD VirtualQuery(LPCVOID, PMEMORY_BASIC_INFORMATION, SIZE_T);
		WINBOOL VirtualProtectEx(HANDLE, LPVOID, SIZE_T, DWORD, PDWORD);
		DWORD VirtualQueryEx(HANDLE, LPCVOID, PMEMORY_BASIC_INFORMATION, SIZE_T);
		HANDLE HeapCreate(DWORD, SIZE_T, SIZE_T);
		WINBOOL HeapDestroy(HANDLE);
		LPVOID HeapAlloc(HANDLE, DWORD, SIZE_T);
		LPVOID HeapReAlloc(HANDLE, DWORD, LPVOID, SIZE_T);
		WINBOOL HeapFree(HANDLE, DWORD, LPVOID);
		SIZE_T HeapSize(HANDLE, DWORD, LPCVOID);
		WINBOOL HeapValidate(HANDLE, DWORD, LPCVOID);
		SIZE_T HeapCompact(HANDLE, DWORD);
		HANDLE GetProcessHeap();
		DWORD GetProcessHeaps(DWORD, PHANDLE);
		WINBOOL HeapLock(HANDLE);
		WINBOOL HeapUnlock(HANDLE);
		WINBOOL HeapWalk(HANDLE, LPPROCESS_HEAP_ENTRY);
		WINBOOL GetProcessAffinityMask(HANDLE, PDWORD_PTR, PDWORD_PTR);
		WINBOOL GetProcessTimes(HANDLE, LPFILETIME, LPFILETIME, LPFILETIME, LPFILETIME);
		WINBOOL GetProcessWorkingSetSize(HANDLE, PSIZE_T, PSIZE_T);
		WINBOOL SetProcessWorkingSetSize(HANDLE, SIZE_T, SIZE_T);
		HANDLE OpenProcess(DWORD, WINBOOL, DWORD);
		HANDLE GetCurrentProcess();
		DWORD GetCurrentProcessId();
		void ExitProcess(UINT);
		WINBOOL TerminateProcess(HANDLE, UINT);
		WINBOOL GetExitCodeProcess(HANDLE, LPDWORD);
		void FatalExit(int);
		void RaiseException(DWORD, DWORD, DWORD, const ULONG_PTR*);
		LONG UnhandledExceptionFilter(EMPTYRECORD*);
		HANDLE CreateRemoteThread(HANDLE, LPSECURITY_ATTRIBUTES, SIZE_T,
				LPTHREAD_START_ROUTINE, LPVOID, DWORD, LPDWORD);
		HANDLE GetCurrentThread();
		DWORD GetCurrentThreadId();
		DWORD_PTR SetThreadAffinityMask(HANDLE, DWORD_PTR);
		WINBOOL SetThreadPriority(HANDLE, int);
		int GetThreadPriority(HANDLE);
		WINBOOL GetThreadTimes(HANDLE, LPFILETIME, LPFILETIME, LPFILETIME, LPFILETIME);
		void ExitThread(DWORD);
		WINBOOL TerminateThread(HANDLE, DWORD);
		WINBOOL GetExitCodeThread(HANDLE, LPDWORD);
		WINBOOL GetThreadSelectorEntry(HANDLE, DWORD, LPLDT_ENTRY);
		DWORD GetLastError();
		void SetLastError(DWORD);
		HANDLE CreateIoCompletionPort(HANDLE, HANDLE, ULONG_PTR, DWORD);
		UINT SetErrorMode(UINT);
		WINBOOL ReadProcessMemory(HANDLE, LPCVOID, LPVOID, SIZE_T, PSIZE_T);
		WINBOOL WriteProcessMemory(HANDLE, LPVOID, LPVOID, SIZE_T, PSIZE_T);
		WINBOOL GetThreadContext(HANDLE, LPCONTEXT);
		DWORD SuspendThread(HANDLE);
		DWORD ResumeThread(HANDLE);
		void DebugBreak();
		WINBOOL WaitForDebugEvent(LPDEBUG_EVENT, DWORD);
		WINBOOL ContinueDebugEvent(DWORD, DWORD, DWORD);
		WINBOOL DebugActiveProcess(DWORD);
		void InitializeCriticalSection(LPCRITICAL_SECTION);
		void EnterCriticalSection(LPCRITICAL_SECTION);
		WINBOOL TryEnterCriticalSection(LPCRITICAL_SECTION);
		void LeaveCriticalSection(LPCRITICAL_SECTION);
		void DeleteCriticalSection(LPCRITICAL_SECTION);
		WINBOOL SetEvent(HANDLE);
		WINBOOL ResetEvent(HANDLE);
		WINBOOL PulseEvent(HANDLE);
		WINBOOL ReleaseSemaphore(HANDLE, LONG, LPLONG);
		WINBOOL ReleaseMutex(HANDLE);
		DWORD WaitForSingleObject(HANDLE, DWORD);
		DWORD WaitForMultipleObjects(DWORD, HANDLE*, WINBOOL, DWORD);
		void Sleep(DWORD);
		HGLOBAL LoadResource(HINST, HRSRC);
		DWORD SizeofResource(HINST, HRSRC);
		ATOM GlobalDeleteAtom(ATOM);
		WINBOOL InitAtomTable(DWORD);
		ATOM DeleteAtom(ATOM);
		UINT SetHandleCount(UINT);
		DWORD GetLogicalDrives();
		WINBOOL LockFile(HANDLE, DWORD, DWORD, DWORD, DWORD);
		WINBOOL UnlockFile(HANDLE, DWORD, DWORD, DWORD, DWORD);
		WINBOOL LockFileEx(HANDLE, DWORD, DWORD, DWORD, DWORD, LPOVERLAPPED);
		WINBOOL UnlockFileEx(HANDLE, DWORD, DWORD, DWORD, LPOVERLAPPED);
		WINBOOL GetFileInformationByHandle(HANDLE, LPBY_HANDLE_FILE_INFORMATION);
		DWORD GetFileType(HANDLE);
		DWORD GetFileSize(HANDLE, LPDWORD);
		HANDLE GetStdHandle(DWORD);
		WINBOOL SetStdHandle(DWORD, HANDLE);
		WINBOOL FlushFileBuffers(HANDLE);
		WINBOOL DeviceIoControl(HANDLE, DWORD, LPVOID, DWORD, LPVOID, DWORD,
				LPDWORD, LPOVERLAPPED);
		WINBOOL SetEndOfFile(HANDLE);
		DWORD SetFilePointer(HANDLE, LONG, PLONG, DWORD);
		WINBOOL FindClose(HANDLE);
		WINBOOL GetFileTime(HANDLE, LPFILETIME, LPFILETIME, LPFILETIME);
		WINBOOL SetFileTime(HANDLE, FILETIME*, FILETIME*, FILETIME*);
		WINBOOL CloseHandle(HANDLE);
		WINBOOL DuplicateHandle(HANDLE, HANDLE, HANDLE, LPHANDLE, DWORD, WINBOOL, DWORD);
		WINBOOL GetHandleInformation(HANDLE, LPDWORD);
		WINBOOL SetHandleInformation(HANDLE, DWORD, DWORD);
		DWORD LoadModule(LPCSTR, LPVOID);
		UINT WinExec(LPCSTR, UINT);
		WINBOOL ClearCommBreak(HANDLE);
		WINBOOL ClearCommError(HANDLE, LPDWORD, LPCOMSTAT);
		WINBOOL SetupComm(HANDLE, DWORD, DWORD);
		WINBOOL EscapeCommFunction(HANDLE, DWORD);
		WINBOOL GetCommConfig(HANDLE, LPCOMMCONFIG, LPDWORD);
		WINBOOL GetCommProperties(HANDLE, LPCOMMPROP);
		WINBOOL GetCommModemStatus(HANDLE, PDWORD);
		WINBOOL GetCommState(HANDLE, PDCB);
		WINBOOL GetCommTimeouts(HANDLE, PCOMMTIMEOUTS);
		WINBOOL PurgeComm(HANDLE, DWORD);
		WINBOOL SetCommBreak(HANDLE);
		WINBOOL SetCommConfig(HANDLE, LPCOMMCONFIG, DWORD);
		WINBOOL SetCommMask(HANDLE, DWORD);
		WINBOOL SetCommState(HANDLE, TDCB*);
		WINBOOL SetCommTimeouts(HANDLE, TCOMMTIMEOUTS*);
		WINBOOL TransmitCommChar(HANDLE, char);
		WINBOOL WaitCommEvent(HANDLE, LPDWORD, LPOVERLAPPED);
		DWORD SetTapePosition(HANDLE, DWORD, DWORD, DWORD, DWORD, WINBOOL);
		DWORD GetTapePosition(HANDLE, DWORD, LPDWORD, LPDWORD, LPDWORD);
		DWORD PrepareTape(HANDLE, DWORD, WINBOOL);
		DWORD EraseTape(HANDLE, DWORD, WINBOOL);
		DWORD CreateTapePartition(HANDLE, DWORD, DWORD, DWORD);
		DWORD WriteTapemark(HANDLE, DWORD, DWORD, WINBOOL);
		DWORD GetTapeStatus(HANDLE);
		DWORD GetTapeParameters(HANDLE, DWORD, LPDWORD, LPVOID);
		DWORD SetTapeParameters(HANDLE, DWORD, LPVOID);
		WINBOOL Beep(DWORD, DWORD);
		int MulDiv(int, int, int);
		void GetSystemTime(LPSYSTEMTIME);
		void GetSystemTimeAsFileTime(FILETIME*);
		WINBOOL SetSystemTime(SYSTEMTIME*);
		void GetLocalTime(LPSYSTEMTIME);
		WINBOOL SetLocalTime(SYSTEMTIME*);
		void GetSystemInfo(LPSYSTEM_INFO);
		WINBOOL SystemTimeToTzSpecificLocalTime(LPTIME_ZONE_INFORMATION, LPSYSTEMTIME, LPSYSTEMTIME);
		DWORD GetTimeZoneInformation(LPTIME_ZONE_INFORMATION);
		WINBOOL SetTimeZoneInformation(TIME_ZONE_INFORMATION*);
		WINBOOL SystemTimeToFileTime(SYSTEMTIME*, LPFILETIME);
		WINBOOL FileTimeToLocalFileTime(FILETIME*, LPFILETIME);
		WINBOOL LocalFileTimeToFileTime(FILETIME*, LPFILETIME);
		WINBOOL FileTimeToSystemTime(FILETIME*, LPSYSTEMTIME);
		LONG CompareFileTime(FILETIME*, FILETIME*);
		WINBOOL FileTimeToDosDateTime(FILETIME*, LPWORD, LPWORD);
		WINBOOL DosDateTimeToFileTime(ushort, ushort, LPFILETIME);
		DWORD GetTickCount();
		WINBOOL SetSystemTimeAdjustment(DWORD, WINBOOL);
		WINBOOL GetSystemTimeAdjustment(PDWORD, PDWORD, PWINBOOL);
		WINBOOL CreatePipe(PHANDLE, PHANDLE, LPSECURITY_ATTRIBUTES, DWORD);
		WINBOOL ConnectNamedPipe(HANDLE, LPOVERLAPPED);
		WINBOOL DisconnectNamedPipe(HANDLE);
		WINBOOL SetNamedPipeHandleState(HANDLE, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL GetNamedPipeInfo(HANDLE, LPDWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL PeekNamedPipe(HANDLE, LPVOID, DWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL TransactNamedPipe(HANDLE, LPVOID, DWORD, LPVOID, DWORD, LPDWORD, LPOVERLAPPED);
		WINBOOL GetMailslotInfo(HANDLE, LPDWORD, LPDWORD, LPDWORD, LPDWORD);
		WINBOOL SetMailslotInfo(HANDLE, DWORD);
		LPVOID MapViewOfFile(HANDLE, DWORD, DWORD, DWORD, SIZE_T);
		WINBOOL FlushViewOfFile(LPCVOID, SIZE_T);
		WINBOOL UnmapViewOfFile(LPVOID);
		HFILE OpenFile(LPCSTR, LPOFSTRUCT, UINT);
		HFILE _lopen(LPCSTR, int);
		HFILE _lcreat(LPCSTR, int);
		UINT _lread(HFILE, LPVOID, UINT);
		UINT _lwrite(HFILE, LPCSTR, UINT);
		int _hread(HFILE, LPVOID, int);
		int _hwrite(HFILE, LPCSTR, int);
		HFILE _lclose(HFILE);
		LONG _llseek(HFILE, LONG, int);
		WINBOOL IsTextUnicode(LPVOID, int, LPINT);
		DWORD TlsAlloc();
		LPVOID TlsGetValue(DWORD);
		WINBOOL TlsSetValue(DWORD, LPVOID);
		WINBOOL TlsFree(DWORD);
		DWORD SleepEx(DWORD, WINBOOL);
		DWORD WaitForSingleObjectEx(HANDLE, DWORD, WINBOOL);
		DWORD WaitForMultipleObjectsEx(DWORD, HANDLE*, WINBOOL, DWORD, WINBOOL);
		WINBOOL ReadFileEx(HANDLE, LPVOID, DWORD, LPOVERLAPPED, LPOVERLAPPED_COMPLETION_ROUTINE);
		WINBOOL WriteFileEx(HANDLE, LPCVOID, DWORD, LPOVERLAPPED, LPOVERLAPPED_COMPLETION_ROUTINE);
		WINBOOL BackupRead(HANDLE, LPBYTE, DWORD, LPDWORD, WINBOOL, WINBOOL, LPVOID*);
		WINBOOL BackupSeek(HANDLE, DWORD, DWORD, LPDWORD, LPDWORD, LPVOID*);
		WINBOOL BackupWrite(HANDLE, LPBYTE, DWORD, LPDWORD, WINBOOL, WINBOOL, LPVOID*);
		WINBOOL SetProcessShutdownParameters(DWORD, DWORD);
		WINBOOL GetProcessShutdownParameters(LPDWORD, LPDWORD);
		void SetFileApisToOEM();
		void SetFileApisToANSI();
		WINBOOL AreFileApisANSI();
		WINBOOL CloseEventLog(HANDLE);
		WINBOOL DeregisterEventSource(HANDLE);
		WINBOOL NotifyChangeEventLog(HANDLE, HANDLE);
		WINBOOL GetNumberOfEventLogRecords(HANDLE, PDWORD);
		WINBOOL GetOldestEventLogRecord(HANDLE, PDWORD);
		WINBOOL DuplicateToken(HANDLE, SECURITY_IMPERSONATION_LEVEL, PHANDLE);
		WINBOOL GetKernelObjectSecurity(HANDLE, SECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, DWORD, LPDWORD);
		WINBOOL ImpersonateNamedPipeClient(HANDLE);
		WINBOOL ImpersonateLoggedOnUser(HANDLE);
		WINBOOL ImpersonateSelf(SECURITY_IMPERSONATION_LEVEL);
		WINBOOL RevertToSelf();
		WINBOOL SetThreadToken(PHANDLE, HANDLE);
		WINBOOL OpenProcessToken(HANDLE, DWORD, PHANDLE);
		WINBOOL OpenThreadToken(HANDLE, DWORD, WINBOOL, PHANDLE);
		WINBOOL GetTokenInformation(HANDLE, TOKEN_INFORMATION_CLASS, LPVOID, DWORD, PDWORD);
		WINBOOL SetTokenInformation(HANDLE, TOKEN_INFORMATION_CLASS, LPVOID, DWORD);
		WINBOOL AdjustTokenPrivileges(HANDLE, WINBOOL, PTOKEN_PRIVILEGES,
				DWORD, PTOKEN_PRIVILEGES, PDWORD);
		WINBOOL AdjustTokenGroups(HANDLE, WINBOOL, PTOKEN_GROUPS, DWORD, PTOKEN_GROUPS, PDWORD);
		WINBOOL PrivilegeCheck(HANDLE, PPRIVILEGE_SET, LPBOOL);
		WINBOOL IsValidSid(PSID);
		WINBOOL EqualSid(PSID, PSID);
		WINBOOL EqualPrefixSid(PSID, PSID);
		DWORD GetSidLengthRequired(UCHAR);
		WINBOOL AllocateAndInitializeSid(PSID_IDENTIFIER_AUTHORITY, ubyte,
				DWORD, DWORD, DWORD, DWORD, DWORD, DWORD, DWORD, DWORD, PSID*);
		PVOID FreeSid(PSID);
		WINBOOL InitializeSid(PSID, PSID_IDENTIFIER_AUTHORITY, ubyte);
		PSID_IDENTIFIER_AUTHORITY GetSidIdentifierAuthority(PSID);
		PDWORD GetSidSubAuthority(PSID, DWORD);
		PUCHAR GetSidSubAuthorityCount(PSID);
		DWORD GetLengthSid(PSID);
		WINBOOL CopySid(DWORD, PSID, PSID);
		WINBOOL AreAllAccessesGranted(DWORD, DWORD);
		WINBOOL AreAnyAccessesGranted(DWORD, DWORD);
		void MapGenericMask(PDWORD);
		WINBOOL IsValidAcl(PACL);
		WINBOOL InitializeAcl(PACL, DWORD, DWORD);
		WINBOOL GetAclInformation(PACL, LPVOID, DWORD, ACL_INFORMATION_CLASS);
		WINBOOL SetAclInformation(PACL, LPVOID, DWORD, ACL_INFORMATION_CLASS);
		WINBOOL AddAce(PACL, DWORD, DWORD, LPVOID, DWORD);
		WINBOOL DeleteAce(PACL, DWORD);
		WINBOOL GetAce(PACL, DWORD, LPVOID*);
		WINBOOL AddAccessAllowedAce(PACL, DWORD, DWORD, PSID);
		WINBOOL AddAccessDeniedAce(PACL, DWORD, DWORD, PSID);
		WINBOOL AddAuditAccessAce(PACL, DWORD, DWORD, PSID, WINBOOL, WINBOOL);
		WINBOOL FindFirstFreeAce(PACL, LPVOID*);
		WINBOOL InitializeSecurityDescriptor(PSECURITY_DESCRIPTOR, DWORD);
		WINBOOL IsValidSecurityDescriptor(PSECURITY_DESCRIPTOR);
		DWORD GetSecurityDescriptorLength(PSECURITY_DESCRIPTOR);
		WINBOOL GetSecurityDescriptorControl(PSECURITY_DESCRIPTOR,
				PSECURITY_DESCRIPTOR_CONTROL, LPDWORD);
		WINBOOL SetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR, WINBOOL, PACL, WINBOOL);
		WINBOOL GetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR, LPBOOL, PACL*, LPBOOL);
		WINBOOL SetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR, WINBOOL, PACL, WINBOOL);
		WINBOOL GetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR, LPBOOL, PACL*, LPBOOL);
		WINBOOL SetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR, PSID, WINBOOL);
		WINBOOL GetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR, PSID*, LPBOOL);
		WINBOOL SetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR, PSID, WINBOOL);
		WINBOOL GetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR, PSID*, LPBOOL);
		WINBOOL CreatePrivateObjectSecurity(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR,
				PSECURITY_DESCRIPTOR*, WINBOOL, HANDLE, PGENERIC_MAPPING);
		WINBOOL SetPrivateObjectSecurity(SECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR*, PGENERIC_MAPPING, HANDLE);
		WINBOOL GetPrivateObjectSecurity(PSECURITY_DESCRIPTOR,
				SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, DWORD, PDWORD);
		WINBOOL DestroyPrivateObjectSecurity(PSECURITY_DESCRIPTOR);
		WINBOOL MakeSelfRelativeSD(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR, LPDWORD);
		WINBOOL MakeAbsoluteSD(PSECURITY_DESCRIPTOR, PSECURITY_DESCRIPTOR,
				LPDWORD, PACL, LPDWORD, PACL, LPDWORD, PSID, LPDWORD, PSID, LPDWORD);
		WINBOOL SetKernelObjectSecurity(HANDLE, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		WINBOOL FindNextChangeNotification(HANDLE);
		WINBOOL FindCloseChangeNotification(HANDLE);
		WINBOOL VirtualLock(LPVOID, SIZE_T);
		WINBOOL VirtualUnlock(LPVOID, SIZE_T);
		LPVOID MapViewOfFileEx(HANDLE, DWORD, DWORD, DWORD, SIZE_T, LPVOID);
		WINBOOL SetPriorityClass(HANDLE, DWORD);
		DWORD GetPriorityClass(HANDLE);
		WINBOOL IsBadReadPtr(POINTER, UINT_PTR);
		WINBOOL IsBadWritePtr(LPVOID, UINT_PTR);
		WINBOOL IsBadHugeReadPtr(POINTER, UINT_PTR);
		WINBOOL IsBadHugeWritePtr(LPVOID, UINT_PTR);
		WINBOOL IsBadCodePtr(FARPROC);
		WINBOOL AllocateLocallyUniqueId(PLUID);
		WINBOOL QueryPerformanceCounter(PLARGE_INTEGER);
		WINBOOL QueryPerformanceFrequency(PLARGE_INTEGER);
		WINBOOL ActivateKeyboardLayout(HKL, UINT);
		WINBOOL UnloadKeyboardLayout(HKL);
		int GetKeyboardLayoutList(int, HKL*);
		HKL GetKeyboardLayout(DWORD);
		HDESK OpenInputDesktop(DWORD, WINBOOL, DWORD);
		WINBOOL EnumDesktopWindows(HDESK, ENUMWINDOWSPROC, LPARAM);
		WINBOOL SwitchDesktop(HDESK);
		WINBOOL SetThreadDesktop(HDESK);
		WINBOOL CloseDesktop(HDESK);
		HDESK GetThreadDesktop(DWORD);
		WINBOOL CloseWindowStation(HWINSTA);
		WINBOOL SetProcessWindowStation(HWINSTA);
		HWINSTA GetProcessWindowStation();
		WINBOOL SetUserObjectSecurity(HANDLE, PSECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		WINBOOL GetUserObjectSecurity(HANDLE, PSECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, DWORD, LPDWORD);
		WINBOOL TranslateMessage(LPMSG);
		WINBOOL SetMessageQueue(int);
		WINBOOL RegisterHotKey(HWND, int, UINT, UINT);
		WINBOOL UnregisterHotKey(HWND, int);
		WINBOOL ExitWindowsEx(UINT, DWORD);
		WINBOOL SwapMouseButton(WINBOOL);
		DWORD GetMessagePos();
		LONG GetMessageTime();
		LONG GetMessageExtraInfo();
		LPARAM SetMessageExtraInfo(LPARAM);
		int BroadcastSystemMessage(DWORD, LPDWORD, UINT, WPARAM, LPARAM);
		WINBOOL AttachThreadInput(DWORD, DWORD, WINBOOL);
		WINBOOL ReplyMessage(LRESULT);
		WINBOOL WaitMessage();
		DWORD WaitForInputIdle(HANDLE, DWORD);
		void PostQuitMessage(int);
		WINBOOL InSendMessage();
		UINT GetDoubleClickTime();
		WINBOOL SetDoubleClickTime(UINT);
		WINBOOL IsWindow(HWND);
		WINBOOL IsMenu(HMENU);
		WINBOOL IsChild(HWND, HWND);
		WINBOOL DestroyWindow(HWND);
		WINBOOL ShowWindow(HWND, int);
		WINBOOL ShowWindowAsync(HWND, int);
		WINBOOL FlashWindow(HWND, WINBOOL);
		WINBOOL ShowOwnedPopups(HWND, WINBOOL);
		WINBOOL OpenIcon(HWND);
		WINBOOL CloseWindow(HWND);
		WINBOOL MoveWindow(HWND, int, int, int, int, WINBOOL);
		WINBOOL SetWindowPos(HWND, HWND, int, int, int, int, UINT);
		WINBOOL GetWindowPlacement(HWND, WINDOWPLACEMENT*);
		WINBOOL SetWindowPlacement(HWND, WINDOWPLACEMENT*);
		HDWP BeginDeferWindowPos(int);
		HDWP DeferWindowPos(HDWP, HWND, HWND, int, int, int, int, UINT);
		WINBOOL EndDeferWindowPos(HDWP);
		WINBOOL IsWindowVisible(HWND);
		WINBOOL IsIconic(HWND);
		WINBOOL AnyPopup();
		WINBOOL BringWindowToTop(HWND);
		WINBOOL IsZoomed(HWND);
		WINBOOL EndDialog(HWND, INT_PTR);
		HWND GetDlgItem(HWND, int);
		WINBOOL SetDlgItemInt(HWND, int, UINT, WINBOOL);
		UINT GetDlgItemInt(HWND, int, WINBOOL*, WINBOOL);
		WINBOOL CheckDlgButton(HWND, int, UINT);
		WINBOOL CheckRadioButton(HWND, int, int, int);
		UINT IsDlgButtonChecked(HWND, int);
		HWND GetNextDlgGroupItem(HWND, HWND, WINBOOL);
		HWND GetNextDlgTabItem(HWND, HWND, WINBOOL);
		int GetDlgCtrlID(HWND);
		int GetDialogBaseUnits();
		WINBOOL OpenClipboard(HWND);
		WINBOOL CloseClipboard();
		HWND GetClipboardOwner();
		HWND SetClipboardViewer(HWND);
		HWND GetClipboardViewer();
		WINBOOL ChangeClipboardChain(HWND, HWND);
		HANDLE SetClipboardData(UINT, HANDLE);
		HANDLE GetClipboardData(UINT);
		int CountClipboardFormats();
		UINT EnumClipboardFormats(UINT);
		WINBOOL EmptyClipboard();
		WINBOOL IsClipboardFormatAvailable(UINT);
		int GetPriorityClipboardFormat(UINT*, int);
		HWND GetOpenClipboardWindow();
		LPSTR CharNextExA(ushort, LPCSTR, DWORD);
		LPSTR CharPrevExA(ushort, LPCSTR, LPCSTR, DWORD);
		HWND SetFocus(HWND);
		HWND GetActiveWindow();
		HWND GetFocus();
		UINT GetKBCodePage();
		SHORT GetKeyState(int);
		SHORT GetAsyncKeyState(int);
		WINBOOL GetKeyboardState(PBYTE);
		WINBOOL SetKeyboardState(LPBYTE);
		int GetKeyboardType(int);
		int ToAscii(UINT, UINT, PBYTE, LPWORD, UINT);
		int ToAsciiEx(UINT, UINT, PBYTE, LPWORD, UINT, HKL);
		int ToUnicode(UINT, UINT, PBYTE, LPWSTR, int, UINT);
		DWORD OemKeyScan(ushort);
		void keybd_event(ubyte, ubyte, DWORD, ULONG_PTR);
		void mouse_event(DWORD, DWORD, DWORD, DWORD, ULONG_PTR);
		WINBOOL GetInputState();
		DWORD GetQueueStatus(UINT);
		HWND GetCapture();
		HWND SetCapture(HWND);
		WINBOOL ReleaseCapture();
		DWORD MsgWaitForMultipleObjects(DWORD, LPHANDLE, WINBOOL, DWORD, DWORD);
		UINT_PTR SetTimer(HWND, UINT_PTR, UINT, TIMERPROC);
		WINBOOL KillTimer(HWND, UINT_PTR);
		WINBOOL IsWindowUnicode(HWND);
		WINBOOL EnableWindow(HWND, WINBOOL);
		WINBOOL IsWindowEnabled(HWND);
		WINBOOL DestroyAcceleratorTable(HACCEL);
		int GetSystemMetrics(int);
		HMENU GetMenu(HWND);
		WINBOOL SetMenu(HWND, HMENU);
		WINBOOL HiliteMenuItem(HWND, HMENU, UINT, UINT);
		UINT GetMenuState(HMENU, UINT, UINT);
		WINBOOL DrawMenuBar(HWND);
		HMENU GetSystemMenu(HWND, WINBOOL);
		HMENU CreateMenu();
		HMENU CreatePopupMenu();
		WINBOOL DestroyMenu(HMENU);
		DWORD CheckMenuItem(HMENU, UINT, UINT);
		WINBOOL EnableMenuItem(HMENU, UINT, UINT);
		HMENU GetSubMenu(HMENU, int);
		UINT GetMenuItemID(HMENU, int);
		int GetMenuItemCount(HMENU);
		WINBOOL RemoveMenu(HMENU, UINT, UINT);
		WINBOOL DeleteMenu(HMENU, UINT, UINT);
		WINBOOL SetMenuItemBitmaps(HMENU, UINT, UINT, HBITMAP, HBITMAP);
		LONG GetMenuCheckMarkDimensions();
		WINBOOL TrackPopupMenu(HMENU, UINT, int, int, int, HWND, RECT*);
		UINT GetMenuDefaultItem(HMENU, UINT, UINT);
		WINBOOL SetMenuDefaultItem(HMENU, UINT, UINT);
		WINBOOL GetMenuItemRect(HWND, HMENU, UINT, LPRECT);
		int MenuItemFromPoint(HWND, HMENU, POINT);
		DWORD DragObject(HWND, HWND, UINT, ULONG_PTR, HCURSOR);
		WINBOOL DragDetect(HWND, POINT);
		WINBOOL DrawIcon(HDC, int, int, HICON);
		WINBOOL UpdateWindow(HWND);
		HWND SetActiveWindow(HWND);
		HWND GetForegroundWindow();
		WINBOOL PaintDesktop(HDC);
		WINBOOL SetForegroundWindow(HWND);
		HWND WindowFromDC(HDC);
		HDC GetDC(HWND);
		HDC GetDCEx(HWND, HRGN, DWORD);
		HDC GetWindowDC(HWND);
		int ReleaseDC(HWND, HDC);
		HDC BeginPaint(HWND, LPPAINTSTRUCT);
		WINBOOL EndPaint(HWND, LPPAINTSTRUCT);
		WINBOOL GetUpdateRect(HWND, LPRECT, WINBOOL);
		int GetUpdateRgn(HWND, HRGN, WINBOOL);
		int SetWindowRgn(HWND, HRGN, WINBOOL);
		int GetWindowRgn(HWND, HRGN);
		int ExcludeUpdateRgn(HDC, HWND);
		WINBOOL InvalidateRect(HWND, RECT*, WINBOOL);
		WINBOOL ValidateRect(HWND, RECT*);
		WINBOOL InvalidateRgn(HWND, HRGN, WINBOOL);
		WINBOOL ValidateRgn(HWND, HRGN);
		WINBOOL RedrawWindow(HWND, RECT*, HRGN, UINT);
		WINBOOL LockWindowUpdate(HWND);
		WINBOOL ScrollWindow(HWND, int, int, RECT*, RECT*);
		WINBOOL ScrollDC(HDC, int, int, RECT*, RECT*, HRGN, LPRECT);
		int ScrollWindowEx(HWND, int, int, RECT*, RECT*, HRGN, LPRECT, UINT);
		int SetScrollPos(HWND, int, int, WINBOOL);
		int GetScrollPos(HWND, int);
		WINBOOL SetScrollRange(HWND, int, int, int, WINBOOL);
		WINBOOL GetScrollRange(HWND, int, LPINT, LPINT);
		WINBOOL ShowScrollBar(HWND, int, WINBOOL);
		WINBOOL EnableScrollBar(HWND, UINT, UINT);
		WINBOOL GetClientRect(HWND, LPRECT);
		WINBOOL GetWindowRect(HWND, LPRECT);
		WINBOOL AdjustWindowRect(LPRECT, DWORD, WINBOOL);
		WINBOOL AdjustWindowRectEx(LPRECT, DWORD, WINBOOL, DWORD);
		WINBOOL SetWindowContextHelpId(HWND, DWORD);
		DWORD GetWindowContextHelpId(HWND);
		WINBOOL SetMenuContextHelpId(HMENU, DWORD);
		DWORD GetMenuContextHelpId(HMENU);
		WINBOOL MessageBeep(UINT);
		int ShowCursor(WINBOOL);
		WINBOOL SetCursorPos(int, int);
		HCURSOR SetCursor(HCURSOR);
		WINBOOL GetCursorPos(LPPOINT);
		WINBOOL ClipCursor(RECT*);
		WINBOOL GetClipCursor(LPRECT);
		HCURSOR GetCursor();
		WINBOOL CreateCaret(HWND, HBITMAP, int, int);
		UINT GetCaretBlinkTime();
		WINBOOL SetCaretBlinkTime(UINT);
		WINBOOL DestroyCaret();
		WINBOOL HideCaret(HWND);
		WINBOOL ShowCaret(HWND);
		WINBOOL SetCaretPos(int, int);
		WINBOOL GetCaretPos(LPPOINT);
		WINBOOL ClientToScreen(HWND, LPPOINT);
		WINBOOL ScreenToClient(HWND, LPPOINT);
		int MapWindowPoints(HWND, HWND, LPPOINT, UINT);
		HWND WindowFromPoint(POINT);
		HWND ChildWindowFromPoint(HWND, POINT);
		DWORD GetSysColor(int);
		HBRUSH GetSysColorBrush(int);
		WINBOOL SetSysColors(int, WINT*, COLORREF*);
		WINBOOL DrawFocusRect(HDC, RECT*);
		int FillRect(HDC, RECT*, HBRUSH);
		int FrameRect(HDC, RECT*, HBRUSH);
		WINBOOL InvertRect(HDC, RECT*);
		WINBOOL SetRect(LPRECT, int, int, int, int);
		WINBOOL SetRectEmpty(LPRECT);
		WINBOOL CopyRect(LPRECT, RECT*);
		WINBOOL InflateRect(LPRECT, int, int);
		WINBOOL IntersectRect(LPRECT, RECT*, RECT*);
		WINBOOL UnionRect(LPRECT, RECT*, RECT*);
		WINBOOL SubtractRect(LPRECT, RECT*, RECT*);
		WINBOOL OffsetRect(LPRECT, int, int);
		WINBOOL IsRectEmpty(RECT*);
		WINBOOL EqualRect(RECT*, RECT*);
		WINBOOL PtInRect(RECT*, POINT);
		ushort GetWindowWord(HWND, int);
		ushort SetWindowWord(HWND, int, ushort);
		ushort GetClassWord(HWND, int);
		ushort SetClassWord(HWND, int, ushort);
		HWND GetDesktopWindow();
		HWND GetParent(HWND);
		HWND SetParent(HWND, HWND);
		WINBOOL EnumChildWindows(HWND, ENUMWINDOWSPROC, LPARAM);
		WINBOOL EnumWindows(ENUMWINDOWSPROC, LPARAM);
		WINBOOL EnumThreadWindows(DWORD, ENUMWINDOWSPROC, LPARAM);
		HWND GetTopWindow(HWND);
		DWORD GetWindowThreadProcessId(HWND, LPDWORD);
		HWND GetLastActivePopup(HWND);
		HWND GetWindow(HWND, UINT);
		WINBOOL UnhookWindowsHook(int, HOOKPROC);
		WINBOOL UnhookWindowsHookEx(HHOOK);
		LRESULT CallNextHookEx(HHOOK, int, WPARAM, LPARAM);
		WINBOOL CheckMenuRadioItem(HMENU, UINT, UINT, UINT, UINT);
		HCURSOR CreateCursor(HINST, int, int, int, int, POINTER, POINTER);
		WINBOOL DestroyCursor(HCURSOR);
		WINBOOL SetSystemCursor(HCURSOR, DWORD);
		HICON CreateIcon(HINST, int, int, ubyte, ubyte, ubyte*, ubyte*);
		WINBOOL DestroyIcon(HICON);
		int LookupIconIdFromDirectory(PBYTE, WINBOOL);
		int LookupIconIdFromDirectoryEx(PBYTE, WINBOOL, int, int, UINT);
		HICON CreateIconFromResource(PBYTE, DWORD, WINBOOL, DWORD);
		HICON CreateIconFromResourceEx(PBYTE, DWORD, WINBOOL, DWORD, int, int, UINT);
		HICON CopyImage(HANDLE, UINT, int, int, UINT);
		HICON CreateIconIndirect(PICONINFO);
		HICON CopyIcon(HICON);
		WINBOOL GetIconInfo(HICON, PICONINFO);
		WINBOOL MapDialogRect(HWND, LPRECT);
		int SetScrollInfo(HWND, int, LPCSCROLLINFO, WINBOOL);
		WINBOOL GetScrollInfo(HWND, int, LPSCROLLINFO);
		WINBOOL TranslateMDISysAccel(HWND, LPMSG);
		UINT ArrangeIconicWindows(HWND);
		ushort TileWindows(HWND, UINT, RECT*, UINT, HWND*);
		ushort CascadeWindows(HWND, UINT, RECT*, UINT, HWND*);
		void SetLastErrorEx(DWORD);
		void SetDebugErrorLevel(DWORD);
		WINBOOL DrawEdge(HDC, LPRECT, UINT, UINT);
		WINBOOL DrawFrameControl(HDC, LPRECT, UINT, UINT);
		WINBOOL DrawCaption(HWND, HDC, RECT*, UINT);
		WINBOOL DrawAnimatedRects(HWND, int, RECT*, RECT*);
		WINBOOL TrackPopupMenuEx(HMENU, UINT, int, int, HWND, LPTPMPARAMS);
		HWND ChildWindowFromPointEx(HWND, POINT, UINT);
		WINBOOL DrawIconEx(HDC, int, int, HICON, int, int, UINT, HBRUSH, UINT);
		WINBOOL AnimatePalette(HPALETTE, UINT, UINT, PALETTEENTRY*);
		WINBOOL Arc(HDC, int, int, int, int, int, int, int, int);
		WINBOOL BitBlt(HDC, int, int, int, int, HDC, int, int, DWORD);
		WINBOOL CancelDC(HDC);
		WINBOOL Chord(HDC, int, int, int, int, int, int, int, int);
		HMETAFILE CloseMetaFile(HDC);
		int CombineRgn(HRGN, HRGN, HRGN, int);
		HBITMAP CreateBitmap(int, int, UINT, UINT, POINTER);
		HBITMAP CreateBitmapIndirect(BITMAP*);
		HBRUSH CreateBrushIndirect(LOGBRUSH*);
		HBITMAP CreateCompatibleBitmap(HDC, int, int);
		HBITMAP CreateDiscardableBitmap(HDC, int, int);
		HDC CreateCompatibleDC(HDC);
		HBITMAP CreateDIBitmap(HDC, BITMAPINFOHEADER*, DWORD, POINTER, BITMAPINFO*, UINT);
		HBRUSH CreateDIBPatternBrush(HGLOBAL, UINT);
		HBRUSH CreateDIBPatternBrushPt(POINTER, UINT);
		HRGN CreateEllipticRgn(int, int, int, int);
		HRGN CreateEllipticRgnIndirect(RECT*);
		HBRUSH CreateHatchBrush(int, COLORREF);
		HPALETTE CreatePalette(LOGPALETTE*);
		HPEN CreatePen(int, int, COLORREF);
		HPEN CreatePenIndirect(LOGPEN*);
		HRGN CreatePolyPolygonRgn(POINT*, WINT*, int, int);
		HBRUSH CreatePatternBrush(HBITMAP);
		HRGN CreateRectRgn(int, int, int, int);
		HRGN CreateRectRgnIndirect(RECT*);
		HRGN CreateRoundRectRgn(int, int, int, int, int, int);
		HBRUSH CreateSolidBrush(COLORREF);
		WINBOOL DeleteDC(HDC);
		WINBOOL DeleteMetaFile(HMETAFILE);
		WINBOOL DeleteObject(HGDIOBJ);
		int DrawEscape(HDC, int, int, LPCSTR);
		WINBOOL Ellipse(HDC, int, int, int, int);
		int EnumObjects(HDC, int, ENUMOBJECTSPROC, LPARAM);
		WINBOOL EqualRgn(HRGN, HRGN);
		int Escape(HDC, int, int, LPCSTR, LPVOID);
		int ExtEscape(HDC, int, int, LPCSTR, int, LPSTR);
		int ExcludeClipRect(HDC, int, int, int, int);
		HRGN ExtCreateRegion(XFORM*, DWORD, RGNDATA*);
		WINBOOL ExtFloodFill(HDC, int, int, COLORREF, UINT);
		WINBOOL FillRgn(HDC, HRGN, HBRUSH);
		WINBOOL FloodFill(HDC, int, int, COLORREF);
		WINBOOL FrameRgn(HDC, HRGN, HBRUSH, int, int);
		int GetROP2(HDC);
		WINBOOL GetAspectRatioFilterEx(HDC, LPSIZE);
		COLORREF GetBkColor(HDC);
		int GetBkMode(HDC);
		LONG GetBitmapBits(HBITMAP, LONG, LPVOID);
		WINBOOL GetBitmapDimensionEx(HBITMAP, LPSIZE);
		UINT GetBoundsRect(HDC, LPRECT, UINT);
		WINBOOL GetBrushOrgEx(HDC, LPPOINT);
		int GetClipBox(HDC, LPRECT);
		int GetClipRgn(HDC, HRGN);
		int GetMetaRgn(HDC, HRGN);
		HGDIOBJ GetCurrentObject(HDC, UINT);
		WINBOOL GetCurrentPositionEx(HDC, LPPOINT);
		int GetDeviceCaps(HDC, int);
		int GetDIBits(HDC, HBITMAP, UINT, UINT, LPVOID, LPBITMAPINFO, UINT);
		DWORD GetFontData(HDC, DWORD, DWORD, LPVOID, DWORD);
		int GetGraphicsMode(HDC);
		int GetMapMode(HDC);
		UINT GetMetaFileBitsEx(HMETAFILE, UINT, LPVOID);
		COLORREF GetNearestColor(HDC, COLORREF);
		UINT GetNearestPaletteIndex(HPALETTE, COLORREF);
		DWORD GetObjectType(HGDIOBJ);
		UINT GetPaletteEntries(HPALETTE, UINT, UINT, LPPALETTEENTRY);
		COLORREF GetPixel(HDC, int, int);
		int GetPixelFormat(HDC);
		int GetPolyFillMode(HDC);
		WINBOOL GetRasterizerCaps(LPRASTERIZER_STATUS, UINT);
		DWORD GetRegionData(HRGN, DWORD, LPRGNDATA);
		int GetRgnBox(HRGN, LPRECT);
		HGDIOBJ GetStockObject(int);
		int GetStretchBltMode(HDC);
		UINT GetSystemPaletteEntries(HDC, UINT, UINT, LPPALETTEENTRY);
		UINT GetSystemPaletteUse(HDC);
		int GetTextCharacterExtra(HDC);
		UINT GetTextAlign(HDC);
		COLORREF GetTextColor(HDC);
		int GetTextCharset(HDC);
		int GetTextCharsetInfo(HDC, LPFONTSIGNATURE, DWORD);
		WINBOOL TranslateCharsetInfo(DWORD*, LPCHARSETINFO, DWORD);
		DWORD GetFontLanguageInfo(HDC);
		WINBOOL GetViewportExtEx(HDC, LPSIZE);
		WINBOOL GetViewportOrgEx(HDC, LPPOINT);
		WINBOOL GetWindowExtEx(HDC, LPSIZE);
		WINBOOL GetWindowOrgEx(HDC, LPPOINT);
		int IntersectClipRect(HDC, int, int, int, int);
		WINBOOL InvertRgn(HDC, HRGN);
		WINBOOL LineDDA(int, int, int, int, LINEDDAPROC, LPARAM);
		WINBOOL LineTo(HDC, int, int);
		WINBOOL MaskBlt(HDC, int, int, int, int, HDC, int, int, HBITMAP, int, int, DWORD);
		WINBOOL PlgBlt(HDC, POINT*, HDC, int, int, int, int, HBITMAP, int, int);
		int OffsetClipRgn(HDC, int, int);
		int OffsetRgn(HRGN, int, int);
		WINBOOL PatBlt(HDC, int, int, int, int, DWORD);
		WINBOOL Pie(HDC, int, int, int, int, int, int, int, int);
		WINBOOL PlayMetaFile(HDC, HMETAFILE);
		WINBOOL PaintRgn(HDC, HRGN);
		WINBOOL PolyPolygon(HDC, POINT*, WINT*, int);
		WINBOOL PtInRegion(HRGN, int, int);
		WINBOOL PtVisible(HDC, int, int);
		WINBOOL RectInRegion(HRGN, RECT*);
		WINBOOL RectVisible(HDC, RECT*);
		WINBOOL Rectangle(HDC, int, int, int, int);
		WINBOOL RestoreDC(HDC, int);
		UINT RealizePalette(HDC);
		WINBOOL RoundRect(HDC, int, int, int, int, int, int);
		WINBOOL ResizePalette(HPALETTE, UINT);
		int SaveDC(HDC);
		int SelectClipRgn(HDC, HRGN);
		int ExtSelectClipRgn(HDC, HRGN, int);
		int SetMetaRgn(HDC);
		HGDIOBJ SelectObject(HDC, HGDIOBJ);
		HPALETTE SelectPalette(HDC, HPALETTE, WINBOOL);
		COLORREF SetBkColor(HDC, COLORREF);
		int SetBkMode(HDC, int);
		LONG SetBitmapBits(HBITMAP, DWORD, POINTER);
		UINT SetBoundsRect(HDC, RECT*, UINT);
		int SetDIBits(HDC, HBITMAP, UINT, UINT, POINTER, PBITMAPINFO, UINT);
		int SetDIBitsToDevice(HDC, int, int, DWORD, DWORD, int, int, UINT,
				UINT, POINTER, BITMAPINFO*, UINT);
		DWORD SetMapperFlags(HDC, DWORD);
		int SetGraphicsMode(HDC, int);
		int SetMapMode(HDC, int);
		HMETAFILE SetMetaFileBitsEx(UINT, ubyte*);
		UINT SetPaletteEntries(HPALETTE, UINT, UINT, PALETTEENTRY*);
		COLORREF SetPixel(HDC, int, int, COLORREF);
		WINBOOL SetPixelV(HDC, int, int, COLORREF);
		int SetPolyFillMode(HDC, int);
		WINBOOL StretchBlt(HDC, int, int, int, int, HDC, int, int, int, int, DWORD);
		WINBOOL SetRectRgn(HRGN, int, int, int, int);
		int StretchDIBits(HDC, int, int, int, int, int, int, int, int, POINTER,
				BITMAPINFO*, UINT, DWORD);
		int SetROP2(HDC, int);
		int SetStretchBltMode(HDC, int);
		UINT SetSystemPaletteUse(HDC, UINT);
		int SetTextCharacterExtra(HDC, int);
		COLORREF SetTextColor(HDC, COLORREF);
		UINT SetTextAlign(HDC, UINT);
		WINBOOL SetTextJustification(HDC, int, int);
		WINBOOL UpdateColors(HDC);
		WINBOOL PlayMetaFileRecord(HDC, LPHANDLETABLE, LPMETARECORD, UINT);
		WINBOOL EnumMetaFile(HDC, HMETAFILE, ENUMMETAFILEPROC, LPARAM);
		HENHMETAFILE CloseEnhMetaFile(HDC);
		WINBOOL DeleteEnhMetaFile(HENHMETAFILE);
		WINBOOL EnumEnhMetaFile(HDC, HENHMETAFILE, ENHMETAFILEPROC, LPVOID, RECT*);
		UINT GetEnhMetaFileHeader(HENHMETAFILE, UINT, LPENHMETAHEADER);
		UINT GetEnhMetaFilePaletteEntries(HENHMETAFILE, UINT, LPPALETTEENTRY);
		UINT GetWinMetaFileBits(HENHMETAFILE, UINT, LPBYTE, WINT, HDC);
		WINBOOL PlayEnhMetaFile(HDC, HENHMETAFILE, RECT*);
		WINBOOL PlayEnhMetaFileRecord(HDC, LPHANDLETABLE, ENHMETARECORD*, UINT);
		HENHMETAFILE SetEnhMetaFileBits(UINT, ubyte*);
		HENHMETAFILE SetWinMetaFileBits(UINT, ubyte*, HDC, METAFILEPICT*);
		WINBOOL GdiComment(HDC, UINT, ubyte*);
		WINBOOL AngleArc(HDC, int, int, DWORD, FLOAT, FLOAT);
		WINBOOL PolyPolyline(HDC, POINT*, DWORD*, DWORD);
		WINBOOL GetWorldTransform(HDC, LPXFORM);
		WINBOOL SetWorldTransform(HDC, XFORM*);
		WINBOOL ModifyWorldTransform(HDC, XFORM*, DWORD);
		WINBOOL CombineTransform(LPXFORM, XFORM*, XFORM*);
		HBITMAP CreateDIBSection(HDC, BITMAPINFO*, UINT, POINTER*, HANDLE, DWORD);
		UINT GetDIBColorTable(HDC, UINT, UINT, RGBQUAD*);
		UINT SetDIBColorTable(HDC, UINT, UINT, RGBQUAD*);
		WINBOOL SetColorAdjustment(HDC, COLORADJUSTMENT*);
		WINBOOL GetColorAdjustment(HDC, LPCOLORADJUSTMENT);
		HPALETTE CreateHalftonePalette(HDC);
		int EndDoc(HDC);
		int StartPage(HDC);
		int EndPage(HDC);
		int AbortDoc(HDC);
		int SetAbortProc(HDC, TABORTPROC);
		WINBOOL ArcTo(HDC, int, int, int, int, int, int, int, int);
		WINBOOL BeginPath(HDC);
		WINBOOL CloseFigure(HDC);
		WINBOOL EndPath(HDC);
		WINBOOL FillPath(HDC);
		WINBOOL FlattenPath(HDC);
		int GetPath(HDC, LPPOINT, LPBYTE, int);
		HRGN PathToRegion(HDC);
		WINBOOL PolyDraw(HDC, POINT*, ubyte*, int);
		WINBOOL SelectClipPath(HDC, int);
		int SetArcDirection(HDC, int);
		WINBOOL SetMiterLimit(HDC, FLOAT, PFLOAT);
		WINBOOL StrokeAndFillPath(HDC);
		WINBOOL StrokePath(HDC);
		WINBOOL WidenPath(HDC);
		HPEN ExtCreatePen(DWORD, DWORD, LOGBRUSH*, DWORD, DWORD*);
		WINBOOL GetMiterLimit(HDC, PFLOAT);
		int GetArcDirection(HDC);
		WINBOOL MoveToEx(HDC, int, int, LPPOINT);
		HRGN CreatePolygonRgn(POINT*, int, int);
		WINBOOL DPtoLP(HDC, LPPOINT, int);
		WINBOOL LPtoDP(HDC, LPPOINT, int);
		WINBOOL Polygon(HDC, POINT*, int);
		WINBOOL Polyline(HDC, POINT*, int);
		WINBOOL PolyBezier(HDC, POINT*, DWORD);
		WINBOOL PolyBezierTo(HDC, POINT*, DWORD);
		WINBOOL PolylineTo(HDC, POINT*, DWORD);
		WINBOOL SetViewportExtEx(HDC, int, int, LPSIZE);
		WINBOOL SetViewportOrgEx(HDC, int, int, LPPOINT);
		WINBOOL SetWindowExtEx(HDC, int, int, LPSIZE);
		WINBOOL SetWindowOrgEx(HDC, int, int, LPPOINT);
		WINBOOL OffsetViewportOrgEx(HDC, int, int, LPPOINT);
		WINBOOL OffsetWindowOrgEx(HDC, int, int, LPPOINT);
		WINBOOL ScaleViewportExtEx(HDC, int, int, int, int, LPSIZE);
		WINBOOL ScaleWindowExtEx(HDC, int, int, int, int, LPSIZE);
		WINBOOL SetBitmapDimensionEx(HBITMAP, int, int, LPSIZE);
		WINBOOL SetBrushOrgEx(HDC, int, int, LPPOINT);
		WINBOOL GetDCOrgEx(HDC, LPPOINT);
		WINBOOL FixBrushOrgEx(HDC, int, int, LPPOINT);
		WINBOOL UnrealizeObject(HGDIOBJ);
		WINBOOL GdiFlush();
		DWORD GdiSetBatchLimit(DWORD);
		DWORD GdiGetBatchLimit();
		int SetICMMode(HDC, int);
		WINBOOL CheckColorsInGamut(HDC, LPVOID, LPVOID, DWORD);
		HANDLE GetColorSpace(HDC);
		WINBOOL SetColorSpace(HDC, HCOLORSPACE);
		WINBOOL DeleteColorSpace(HCOLORSPACE);
		WINBOOL GetDeviceGammaRamp(HDC, LPVOID);
		WINBOOL SetDeviceGammaRamp(HDC, LPVOID);
		WINBOOL ColorMatchToTarget(HDC, HDC, DWORD);
		HPROPSHEETPAGE CreatePropertySheetPageA(LPCPROPSHEETPAGE);
		WINBOOL DestroyPropertySheetPage(HPROPSHEETPAGE);
		void InitCommonControls();
		HIMAGELIST ImageList_Create(int, int, UINT, int, int);
		WINBOOL ImageList_Destroy(HIMAGELIST);
		int ImageList_GetImageCount(HIMAGELIST);
		int ImageList_Add(HIMAGELIST, HBITMAP, HBITMAP);
		int ImageList_ReplaceIcon(HIMAGELIST, int, HICON);
		COLORREF ImageList_SetBkColor(HIMAGELIST, COLORREF);
		COLORREF ImageList_GetBkColor(HIMAGELIST);
		WINBOOL ImageList_SetOverlayImage(HIMAGELIST, int, int);
		WINBOOL ImageList_Draw(HIMAGELIST, int, HDC, int, int, UINT);
		WINBOOL ImageList_Replace(HIMAGELIST, int, HBITMAP, HBITMAP);
		int ImageList_AddMasked(HIMAGELIST, HBITMAP, COLORREF);
		WINBOOL ImageList_DrawEx(HIMAGELIST, int, HDC, int, int, int, int,
				COLORREF, COLORREF, UINT);
		WINBOOL ImageList_Remove(HIMAGELIST, int);
		HICON ImageList_GetIcon(HIMAGELIST, int, UINT);
		WINBOOL ImageList_BeginDrag(HIMAGELIST, int, int, int);
		void ImageList_EndDrag();
		WINBOOL ImageList_DragEnter(HWND, int, int);
		WINBOOL ImageList_DragLeave(HWND);
		WINBOOL ImageList_DragMove(int, int);
		WINBOOL ImageList_SetDragCursorImage(HIMAGELIST, int, int, int);
		WINBOOL ImageList_DragShowNolock(WINBOOL);
		HIMAGELIST ImageList_GetDragImage(POINT*, POINT*);
		WINBOOL ImageList_GetIconSize(HIMAGELIST, int*, int*);
		WINBOOL ImageList_SetIconSize(HIMAGELIST, int, int);
		WINBOOL ImageList_GetImageInfo(HIMAGELIST, int, IMAGEINFO*);
		HIMAGELIST ImageList_Merge(HIMAGELIST, int, HIMAGELIST, int, int, int);
		HWND CreateToolbarEx(HWND, DWORD, UINT, int, HINST, UINT_PTR,
				LPCTBBUTTON, int, int, int, int, int, UINT);
		HBITMAP CreateMappedBitmap(HINST, INT_PTR, UINT, LPCOLORMAP, int);
		void MenuHelp(UINT, WPARAM, LPARAM, HMENU, HINST, HWND);
		WINBOOL ShowHideMenuCtl(HWND, UINT_PTR, LPINT);
		void GetEffectiveClientRect(HWND, LPRECT);
		WINBOOL MakeDragList(HWND);
		void DrawInsert(HWND, HWND);
		int LBItemFromPt(HWND, POINT, WINBOOL);
		HWND CreateUpDownControl(DWORD, int, int, int, int, HWND, int, HINST, HWND, int, int, int);
		LONG RegCloseKey(HKEY);
		LONG RegSetKeySecurity(HKEY, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		LONG RegFlushKey(HKEY);
		LONG RegGetKeySecurity(HKEY, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, LPDWORD);
		LONG RegNotifyChangeKeyValue(HKEY, WINBOOL, DWORD, HANDLE, WINBOOL);
		WINBOOL IsValidCodePage(UINT);
		UINT GetACP();
		UINT GetOEMCP();
		WINBOOL GetCPInfo(UINT, LPCPINFO);
		WINBOOL IsDBCSLeadByte(ubyte);
		WINBOOL IsDBCSLeadByteEx(UINT, ubyte);
		int MultiByteToWideChar(UINT, DWORD, LPCSTR, int, LPWSTR, int);
		int WideCharToMultiByte(UINT, DWORD, LPCWSTR, int, LPSTR, int, LPCSTR, LPBOOL);
		WINBOOL IsValidLocale(LCID, DWORD);
		LCID ConvertDefaultLocale(LCID);
		LCID GetThreadLocale();
		WINBOOL SetThreadLocale(LCID);
		LANGID GetSystemDefaultLangID();
		LANGID GetUserDefaultLangID();
		LCID GetSystemDefaultLCID();
		LCID GetUserDefaultLCID();
		WINBOOL ReadConsoleOutputAttribute(HANDLE, LPWORD, DWORD, COORD, LPDWORD);
		WINBOOL WriteConsoleOutputAttribute(HANDLE, ushort*, DWORD, COORD, LPDWORD);
		WINBOOL FillConsoleOutputAttribute(HANDLE, ushort, DWORD, COORD, LPDWORD);
		WINBOOL GetConsoleMode(HANDLE, LPDWORD);
		WINBOOL GetNumberOfConsoleInputEvents(HANDLE, PDWORD);
		WINBOOL GetConsoleScreenBufferInfo(HANDLE, PCONSOLE_SCREEN_BUFFER_INFO);
		COORD GetLargestConsoleWindowSize(HANDLE);
		WINBOOL GetConsoleCursorInfo(HANDLE, PCONSOLE_CURSOR_INFO);
		WINBOOL GetNumberOfConsoleMouseButtons(LPDWORD);
		WINBOOL SetConsoleMode(HANDLE, DWORD);
		WINBOOL SetConsoleActiveScreenBuffer(HANDLE);
		WINBOOL FlushConsoleInputBuffer(HANDLE);
		WINBOOL SetConsoleScreenBufferSize(HANDLE, COORD);
		WINBOOL SetConsoleCursorPosition(HANDLE, COORD);
		WINBOOL SetConsoleCursorInfo(HANDLE, PCONSOLE_CURSOR_INFO);
		WINBOOL SetConsoleWindowInfo(HANDLE, WINBOOL, SMALL_RECT*);
		WINBOOL SetConsoleTextAttribute(HANDLE, ushort);
		WINBOOL SetConsoleCtrlHandler(PHANDLER_ROUTINE, WINBOOL);
		WINBOOL GenerateConsoleCtrlEvent(DWORD, DWORD);
		WINBOOL AllocConsole();
		WINBOOL FreeConsole();
		HANDLE CreateConsoleScreenBuffer(DWORD, DWORD, SECURITY_ATTRIBUTES*, DWORD, LPVOID);
		UINT GetConsoleCP();
		WINBOOL SetConsoleCP(UINT);
		UINT GetConsoleOutputCP();
		WINBOOL SetConsoleOutputCP(UINT);
		DWORD WNetConnectionDialog(HWND, DWORD);
		DWORD WNetDisconnectDialog(HWND, DWORD);
		DWORD WNetCloseEnum(HANDLE);
		WINBOOL CloseServiceHandle(SC_HANDLE);
		WINBOOL ControlService(SC_HANDLE, DWORD, LPSERVICE_STATUS);
		WINBOOL DeleteService(SC_HANDLE);
		SC_LOCK LockServiceDatabase(SC_HANDLE);
		WINBOOL NotifyBootConfigStatus(WINBOOL);
		WINBOOL QueryServiceObjectSecurity(SC_HANDLE, SECURITY_INFORMATION,
				PSECURITY_DESCRIPTOR, DWORD, LPDWORD);
		WINBOOL QueryServiceStatus(SC_HANDLE, LPSERVICE_STATUS);
		WINBOOL SetServiceObjectSecurity(SC_HANDLE, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
		WINBOOL SetServiceStatus(SERVICE_STATUS_HANDLE, LPSERVICE_STATUS);
		WINBOOL UnlockServiceDatabase(SC_LOCK);
		int ChoosePixelFormat(HDC, PIXELFORMATDESCRIPTOR*);
		int DescribePixelFormat(HDC, int, UINT, LPPIXELFORMATDESCRIPTOR);
		WINBOOL SetPixelFormat(HDC, int, PPIXELFORMATDESCRIPTOR);
		WINBOOL SwapBuffers(HDC);
		WINBOOL DragQueryPoint(HDROP, LPPOINT);
		void DragFinish(HDROP);
		void DragAcceptFiles(HWND, BOOL);
		HICON DuplicateIcon(HINST, HICON);
		BOOL DdeAbandonTransaction(DWORD, HCONV, DWORD);
		PBYTE DdeAccessData(HDDEDATA, PDWORD);
		HDDEDATA DdeAddData(HDDEDATA, PBYTE, DWORD, DWORD);
		HDDEDATA DdeClientTransaction(PBYTE, DWORD, HCONV, HSZ, UINT, UINT, DWORD, PDWORD);
		int DdeCmpStringHandles(HSZ, HSZ);
		HCONV DdeConnect(DWORD, HSZ, HSZ, CONVCONTEXT*);
		HCONVLIST DdeConnectList(DWORD, HSZ, HSZ, HCONVLIST, PCONVCONTEXT);
		HDDEDATA DdeCreateDataHandle(DWORD, LPBYTE, DWORD, DWORD, HSZ, UINT, UINT);
		WINBOOL DdeDisconnect(HCONV);
		BOOL DdeDisconnectList(HCONVLIST);
		BOOL DdeEnableCallback(DWORD, HCONV, UINT);
		WINBOOL DdeFreeDataHandle(HDDEDATA);
		WINBOOL DdeFreeStringHandle(DWORD, HSZ);
		DWORD DdeGetData(HDDEDATA, ubyte*, DWORD, DWORD);
		UINT DdeGetLastError(DWORD);
		BOOL DdeImpersonateClient(HCONV);
		BOOL DdeKeepStringHandle(DWORD, HSZ);
		HDDEDATA DdeNameService(DWORD, HSZ, HSZ, UINT);
		WINBOOL DdePostAdvise(DWORD, HSZ, HSZ);
		UINT DdeQueryConvInfo(HCONV, DWORD, PCONVINFO);
		HCONV DdeQueryNextServer(HCONVLIST, HCONV);
		HCONV DdeReconnect(HCONV);
		BOOL DdeSetUserHandle(HCONV, DWORD, DWORD_PTR);
		BOOL DdeUnaccessData(HDDEDATA);
		WINBOOL DdeUninitialize(DWORD);
		void SHAddToRecentDocs(UINT);
		LPITEMIDLIST SHBrowseForFolder(LPBROWSEINFO);
		void SHChangeNotify(LONG, UINT, LPCVOID);
		int SHFileOperationA(LPSHFILEOPSTRUCTA);
		int SHFileOperationW(LPSHFILEOPSTRUCTW);
		void SHFreeNameMappings(HANDLE);
		DWORD_PTR SHGetFileInfoA(LPCSTR, DWORD, SHFILEINFOA*, UINT, UINT);
		DWORD_PTR SHGetFileInfoW(LPCWSTR, DWORD, SHFILEINFOW*, UINT, UINT);
		WINBOOL SHGetPathFromIDListA(LPCITEMIDLIST, LPSTR);
		WINBOOL SHGetPathFromIDListW(LPCITEMIDLIST, LPWSTR);
		HRESULT SHGetSpecialFolderLocation(HWND, int, LPITEMIDLIST*);
		THANDLE CreateThread(POINTER, SIZE_T, TFNTHREADSTARTROUTINE, POINTER, DWORD, DWORD*);
		BOOL DdeSetQualityOfService(HWND, TSECURITYQUALITYOFSERVICE*, PSECURITYQUALITYOFSERVICE);
		BOOL GetCommMask(THANDLE, DWORD*);
		BOOL GetDiskFreeSpaceExA(LPCSTR, void*, void*, PLARGEINTEGER);
		BOOL GetDiskFreeSpaceExW(LPWSTR, void*, void*, PLARGEINTEGER);
		DWORD GetKerningPairs(HDC, DWORD, void*);
		BOOL GetOverlappedResult(THANDLE, TOVERLAPPED*, DWORD*, BOOL);
		BOOL GetQueuedCompletionStatus(THANDLE, DWORD*, ULONG_PTR*, POVERLAPPED*, DWORD);
		BOOL GetSystemPowerStatus(TSYSTEMPOWERSTATUS*);
		BOOL ReadFile(THANDLE, void*, DWORD, DWORD*, POVERLAPPED);
		BOOL SetThreadContext(THANDLE, TCONTEXT*);
		BOOL wglDescribeLayerPlane(HDC, int, int, uint, TLAYERPLANEDESCRIPTOR*);
		int wglGetLayerPaletteEntries(HDC, int, int, int, void*);
		int wglSetLayerPaletteEntries(HDC, int, int, int, void*);
		DWORD WNetGetResourceParentA(PNETRESOURCEA, POINTER, DWORD*);
		BOOL WriteFile(THANDLE, void*, DWORD, DWORD*, POVERLAPPED);

		BOOL CancelWaitableTimer(HANDLE hTimer);
		HANDLE OpenWaitableTimerA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpTimerName);
		HANDLE OpenWaitableTimerW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpTimerName);
		HANDLE CreateWaitableTimerA(LPSECURITY_ATTRIBUTES lpTimerAttributes,
				BOOL bManualReset, LPCSTR lpTimerName);
		HANDLE CreateWaitableTimerW(LPSECURITY_ATTRIBUTES lpTimerAttributes,
				BOOL bManualReset, LPCWSTR lpTimerName);
		BOOL SetWaitableTimer(HANDLE hTimer, LARGE_INTEGER* pDueTime, LONG lPeriod,
				PTIMERAPCROUTINE pfnCompletionRoutine, LPVOID lpArgToCompletionRoutine, BOOL fResume);
	}

	version (Win32SansUnicode) {
		alias SHFileOperation = SHFileOperationA;
	}
	else {
		alias SHFileOperation = SHFileOperationW;
	}

}

version (Win32SansUnicode) {
	alias SHGetFileInfo = SHGetFileInfoA;
	alias SHGetPathFromIDList = SHGetPathFromIDListA;
}
else {
	alias SHGetFileInfo = SHGetFileInfoW;
	alias SHGetPathFromIDList = SHGetPathFromIDListW;
}

////////////////////////////////////////////////////////////////////////////////////////
// org.eclipse.swt
////////////////////////////////////////////////////////////////////////////////////////

extern (Windows) {
	HRESULT AssocQueryStringA(ASSOCF flags, int str, LPCSTR pszAssoc,
			LPCSTR pszExtra, LPSTR pszOut, DWORD* pcchOut);
	HRESULT AssocQueryStringW(ASSOCF flags, int str, LPCWSTR pszAssoc,
			LPCWSTR pszExtra, LPWSTR pszOut, DWORD* pcchOut);
	int AddFontResourceExA(LPCSTR lpszFilename, int fl, void* pdv);
	int AddFontResourceExW(LPCWSTR lpszFilename, int fl, void* pdv);

	BOOL AlphaBlend(HDC hdcDest, // handle to destination DC
			int nXOriginDest, // x-coord of upper-left corner
			int nYOriginDest, // y-coord of upper-left corner
			int nWidthDest, // destination width
			int nHeightDest, // destination height
			HDC hdcSrc, // handle to source DC
			int nXOriginSrc, // x-coord of upper-left corner
			int nYOriginSrc, // y-coord of upper-left corner
			int nWidthSrc, // source width
			int nHeightSrc, // source height
			BLENDFUNCTION blendFunction // alpha-blending function
			);
	BOOL TransparentBlt(HDC hdcDest, // handle to destination DC
			int nXOriginDest, // x-coord of destination upper-left corner
			int nYOriginDest, // y-coord of destination upper-left corner
			int nWidthDest, // width of destination rectangle
			int hHeightDest, // height of destination rectangle
			HDC hdcSrc, // handle to source DC
			int nXOriginSrc, // x-coord of source upper-left corner
			int nYOriginSrc, // y-coord of source upper-left corner
			int nWidthSrc, // width of source rectangle
			int nHeightSrc, // height of source rectangle
			UINT crTransparent // color to make transparent
			);
	int IIDFromString(LPCWSTR lpsz, byte* lpiid);
	HRESULT ScriptJustify(SCRIPT_VISATTR* psva, int* piAdvance, int cGlyphs,
			int iDx, int iMinKashida, int* piJustify);

	HRESULT ScriptRecordDigitSubstitution(LCID Locale, SCRIPT_DIGITSUBSTITUTE* psds);
	HRESULT ScriptApplyDigitSubstitution(SCRIPT_DIGITSUBSTITUTE* psds,
			SCRIPT_CONTROL* psc, SCRIPT_STATE* pss);

	// UxTheme.dll
	BOOL IsAppThemed();

	HRESULT DrawThemeBackground(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
			RECT* pRect, RECT* pClipRect);
	HRESULT DrawThemeEdge(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
			LPCRECT pDestRect, UINT uEdge, UINT uFlags, LPRECT pContentRect);
	HRESULT DrawThemeIcon(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
			LPCRECT pRect, HIMAGELIST himl, int iImageIndex);
	HRESULT DrawThemeParentBackground(HWND hwnd, HDC hdc, RECT* prc);
	HRESULT DrawThemeText(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
			LPCWSTR pszText, int iCharCount, DWORD dwTextFlags, DWORD dwTextFlags2, LPCRECT pRect);

	HTHEME OpenThemeData(HWND hwnd, LPCWSTR pszClassList);
	HRESULT BufferedPaintInit();
	HRESULT CloseThemeData(HTHEME hTheme);
	HRESULT BufferedPaintUnInit();
	//BOOL IsHungAppWindow(
	//    HWND hWnd
	//);
	HPAINTBUFFER BeginBufferedPaint(HDC hdcTarget, RECT* prcTarget, uint /+BP_BUFFERFORMAT+/ dwFormat,
			void*  /+BP_PAINTPARAMS+/ pPaintParams, HDC* phdc);
	HRESULT EndBufferedPaint(HPAINTBUFFER hBufferedPaint, BOOL fUpdateTarget);

	HRESULT GetThemeTextExtent(HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText,
			int iCharCount, DWORD dwTextFlags, LPCRECT pBoundingRect, LPRECT pExtentRect);
	HRESULT SetWindowTheme(HWND hwnd, LPCWSTR pszSubAppName, LPCWSTR pszSubIdList);

	//Kernel32.lib
	//LANGID GetSystemDefaultUILanguage();

	// Macro from winnt.h/windows.h
	WORD PRIMARYLANGID(WORD lgid);

	//Gdi32.lib
	//int IntersectClipRect(
	//  HDC hdc,         // handle to DC
	//  int nLeftRect,   // x-coord of upper-left corner
	//  int nTopRect,    // y-coord of upper-left corner
	//  int nRightRect,  // x-coord of lower-right corner
	//  int nBottomRect  // y-coord of lower-right corner
	//);
	//
	LRESULT CoCreateInstance(byte* rclsid, void* pUnkOuter, int dwClsContext,
			byte* riid, void* ppv);
	/+
// kernel32 winxp/vista
version(ANSI){
HANDLE CreateActCtxA(
  ACTCTXA* pActCtx
);
}
else{
HANDLE CreateActCtxW(
  ACTCTXW* pActCtx
);
}
BOOL ActivateActCtx(
  HACTCTX hActCtx,
  ULONG_PTR* lpCookie
);
+/
}
//--------------------------------------------------------------------------------------

// Windows API
extern (Windows) {
	//int AbortDoc(HDC hdc);
	//HKL ActivateKeyboardLayout(
	//    HKL hkl,     // handle to keyboard layout
	//    UINT Flags   // keyboard layout flags
	//);
	//BOOL AdjustWindowRectEx(
	//    LPRECT lpRect,    // pointer to client-rectangle structure
	//    DWORD dwStyle,    // window styles
	//    BOOL bMenu,       // menu-present flag
	//    DWORD dwExStyle   // extended style
	//);
	//BOOL Arc(
	//    HDC hdc,         // handle to device context
	//    int nLeftRect,   // x-coord of bounding rectangle's upper-left corner
	//    int nTopRect,    // y-coord of bounding rectangle's upper-left corner
	//    int nRightRect,  // x-coord of bounding rectangle's lower-right corner
	//    int nBottomRect, // y-coord of bounding rectangle's lower-right corner
	//    int nXStartArc,  // first radial ending point
	//    int nYStartArc,  // first radial ending point
	//    int nXEndArc,    // second radial ending point
	//    int nYEndArc     // second radial ending point
	//);
	//HDWP BeginDeferWindowPos(
	//    int nNumWindows
	//);
	////alias STDWIN.BeginPaint BeginPaint;
	//BOOL BitBlt(
	//    HDC hdcDest, // handle to destination device context
	//    int nXDest,  // x-coordinate of destination rectangle's upper-left corner
	//    int nYDest,  // y-coordinate of destination rectangle's upper-left corner
	//    int nWidth,  // width of destination rectangle
	//    int nHeight, // height of destination rectangle
	//    HDC hdcSrc,  // handle to source device context
	//    int nXSrc,   // x-coordinate of source rectangle's upper-left corner
	//    int nYSrc,   // y-coordinate of source rectangle's upper-left corner
	//    DWORD dwRop  // raster operation code
	//);
	//BOOL BringWindowToTop(
	//    HWND hWnd   // handle to window
	//);
	//LRESULT CallNextHookEx(
	//    HHOOK hhk,      // handle to current hook
	//    int nCode,      // hook code passed to hook procedure
	//    WPARAM wParam,  // value passed to hook procedure
	//    LPARAM lParam   // value passed to hook procedure
	//);
	//LRESULT CallWindowProcA(
	//    WNDPROC lpPrevWndFunc,  // pointer to previous procedure
	//    HWND hWnd,              // handle to window
	//    UINT Msg,               // message
	//    WPARAM wParam,          // first message parameter
	//    LPARAM lParam           // second message parameter
	//);
	//LRESULT CallWindowProcW(
	//    WNDPROC lpPrevWndFunc,  // pointer to previous procedure
	//    HWND hWnd,              // handle to window
	//    UINT Msg,               // message
	//    WPARAM wParam,          // first message parameter
	//    LPARAM lParam           // second message parameter
	//);
	//LPSTR CharLowerA(
	//    LPSTR lpsz   // single character or pointer to string
	//);
	//LPWSTR CharLowerW(
	//    LPWSTR lpsz   // single character or pointer to string
	//);
	//LPSTR CharUpperA(
	//    LPSTR lpsz   // single character or pointer to string
	//);
	//LPWSTR CharUpperW(
	//    LPWSTR lpsz   // single character or pointer to string
	//);
	//DWORD CheckMenuItem(
	//    HMENU hmenu,        // handle to menu
	//    UINT uIDCheckItem,  // menu item to check or uncheck
	//    UINT uCheck         // menu item flags
	//);
	//BOOL ChooseColorA(
	//    LPCHOOSECOLORA lpcc   // pointer to structure with initialization data
	//);
	//BOOL ChooseColorW(
	//    LPCHOOSECOLORW lpcc   // pointer to structure with initialization data
	//);
	//BOOL ChooseFontA(
	//    LPCHOOSEFONTA lpcf   // pointer to structure with initialization data
	//);
	//BOOL ChooseFontW(
	//    LPCHOOSEFONTW lpcf   // pointer to structure with initialization data
	//);
	////alias STDWIN.ClientToScreen ClientToScreen;
	//BOOL CloseClipboard();
	//int CombineRgn(
	//    HRGN hrgnDest,      // handle to destination region
	//    HRGN hrgnSrc1,      // handle to source region
	//    HRGN hrgnSrc2,      // handle to source region
	//    int fnCombineMode   // region combining mode
	//);
	//alias STDWIN.CloseHandle CloseHandle;
	DWORD CommDlgExtendedError();

	version (WinCE) {
		BOOL CommandBar_AddAdornments(HWND hwndCB, DWORD dwFlags, DWORD dwReserved);
		HWND CommandBar_Create(HINSTANCE hInst, HWND hwndParent, int idCmdBar);
		void CommandBar_Destroy(HWND hwndCB);
		BOOL CommandBar_DrawMenuBar(HWND hwndCB, int iButton);
		int CommandBar_Height(HWND hwndCB);
		int CommandBar_InsertMenubarEx(HWND hwndCB, HINSTANCE hInst, int pszMenu, int iButton);
		int CommandBar_Show(HWND hwndCB, int fShow);
	}

	//HANDLE CopyImage(
	//    HANDLE hImage,  // handle to the image to copy
	//    UINT uType,     // type of image to copy
	//    int cxDesired,  // desired width of new image
	//    int cyDesired,  // desired height of new image
	//    UINT fuFlags    // copy flags
	//);
	//HACCEL CreateAcceleratorTableA(
	//    LPACCEL lpaccl,  // pointer to structure array with accelerator data
	//    int cEntries     // number of structures in the array
	//);
	//HACCEL CreateAcceleratorTableW(
	//    LPACCEL lpaccl,  // pointer to structure array with accelerator data
	//    int cEntries     // number of structures in the array
	//);
	//HBITMAP CreateBitmap(
	//    int nWidth,         // bitmap width, in pixels
	//    int nHeight,        // bitmap height, in pixels
	//    UINT cPlanes,       // number of color planes used by device
	//    UINT cBitsPerPel,   // number of bits required to identify a color
	//    VOID *lpvBits // pointer to array containing color data
	//);
	////alias STDWIN.CreateCaret CreateCaret;
	//HBITMAP CreateCompatibleBitmap(
	//    HDC hdc,        // handle to device context
	//    int nWidth,     // width of bitmap, in pixels
	//    int nHeight     // height of bitmap, in pixels
	//);
	////alias STDWIN.CreateCompatibleDC CreateCompatibleDC;
	//HCURSOR CreateCursor(
	//    HINSTANCE hInst,         // handle to application instance
	//    int xHotSpot,            // horizontal position of hot spot
	//    int yHotSpot,            // vertical position of hot spot
	//    int nWidth,              // cursor width
	//    int nHeight,             // cursor height
	//    VOID *pvANDPlane,  // pointer to AND bitmask array
	//    VOID *pvXORPlane   // pointer to XOR bitmask array
	//);
	//HDC CreateDCA(
	//    LPCSTR lpszDriver,  // pointer to string specifying driver name
	//    LPCSTR lpszDevice,  // pointer to string specifying device name
	//    LPCSTR lpszOutput,  // do not use; set to NULL
	//    DEVMODE *lpInitData
	//                   // pointer to optional printer data
	//);
	//HDC CreateDCW(
	//    LPCWSTR lpszDriver,  // pointer to string specifying driver name
	//    LPCWSTR lpszDevice,  // pointer to string specifying device name
	//    LPCWSTR lpszOutput,  // do not use; set to NULL
	//    DEVMODE *lpInitData
	//                   // pointer to optional printer data
	//);
	//HBITMAP CreateDIBSection(
	//    HDC hdc,           // handle to device context
	//    BITMAPINFO *pbmi,  // pointer to structure containing bitmap size,
	//                       // format, and color data
	//    UINT iUsage,       // color data type indicator: RGB values or
	//                       // palette indexes
	//    VOID **ppvBits,    // pointer to variable to receive a pointer to
	//                       // the bitmap's bit values
	//    HANDLE hSection,   // optional handle to a file mapping object
	//    DWORD dwOffset     // offset to the bitmap bit values within the
	//                       // file mapping object
	//);
	//HANDLE CreateEventA(
	//  LPSECURITY_ATTRIBUTES lpEventAttributes,
	//                      // pointer to security attributes
	//  BOOL bManualReset,  // flag for manual-reset event
	//  BOOL bInitialState, // flag for initial state
	//  LPCSTR lpName      // pointer to event-object name
	//);
	//HANDLE CreateEventW(
	//  LPSECURITY_ATTRIBUTES lpEventAttributes,
	//                      // pointer to security attributes
	//  BOOL bManualReset,  // flag for manual-reset event
	//  BOOL bInitialState, // flag for initial state
	//  LPCWSTR lpName      // pointer to event-object name
	//);
	//
	////alias STDWIN.CreateFileA CreateFileA;
	////alias STDWIN.CreateFileW CreateFileW;
	//HFONT CreateFontIndirectA(LOGFONTA* lplf );
	//HFONT CreateFontIndirectW(LOGFONTW* lplf );
	//HICON CreateIconIndirect(
	//    PICONINFO piconinfo   // pointer to icon information structure
	//);
	//HMENU CreateMenu();
	//HPALETTE CreatePalette(
	//    LOGPALETTE *lplgpl   // pointer to logical color palette
	//);
	//HBRUSH CreatePatternBrush(
	//    HBITMAP hbmp   // handle to bitmap
	//);
	////alias STDWIN.CreatePen CreatePen;
	//HRGN CreatePolygonRgn(
	//    POINT *lppt,  // pointer to array of points
	//    int cPoints,        // number of points in array
	//    int fnPolyFillMode  // polygon-filling mode
	//);
	//HMENU CreatePopupMenu();
	////alias STDWIN.CreateRectRgn CreateRectRgn;
	//HBRUSH CreateSolidBrush(
	//    COLORREF crColor   // brush color value
	//);
	//
	////alias STDWIN.CreateWindowExA CreateWindowExA;
	//HWND CreateWindowExW(
	//    DWORD dwExStyle,      // extended window style
	//    LPCWSTR lpClassName,  // pointer to registered class name
	//    LPCWSTR lpWindowName, // pointer to window name
	//    DWORD dwStyle,        // window style
	//    int x,                // horizontal position of window
	//    int y,                // vertical position of window
	//    int nWidth,           // window width
	//    int nHeight,          // window height
	//    HWND hWndParent,      // handle to parent or owner window
	//    HMENU hMenu,          // handle to menu, or child-window identifier
	//    HINSTANCE hInstance,  // handle to application instance
	//    LPVOID lpParam        // pointer to window-creation data
	//);
	//
	//LRESULT DefFrameProcA(
	//    HWND hWnd,           // handle to MDI frame window
	//    HWND hWndMDIClient,  // handle to MDI client window
	//    UINT uMsg,           // message
	//    WPARAM wParam,       // first message parameter
	//    LPARAM lParam        // second message parameter
	//);
	//LRESULT DefFrameProcW(
	//    HWND hWnd,           // handle to MDI frame window
	//    HWND hWndMDIClient,  // handle to MDI client window
	//    UINT uMsg,           // message
	//    WPARAM wParam,       // first message parameter
	//    LPARAM lParam        // second message parameter
	//);
	//LRESULT DefMDIChildProcA(
	//    HWND hWnd,      // handle to MDI child window
	//    UINT uMsg,      // message
	//    WPARAM wParam,  // first message parameter
	//    LPARAM lParam   // second message parameter
	//);
	//LRESULT DefMDIChildProcW(
	//    HWND hWnd,      // handle to MDI child window
	//    UINT uMsg,      // message
	//    WPARAM wParam,  // first message parameter
	//    LPARAM lParam   // second message parameter
	//);
	////alias STDWIN.DefWindowProcA DefWindowProcA;
	//LRESULT DefWindowProcW(
	//    HWND hWnd,      // handle to window
	//    UINT Msg,       // message identifier
	//    WPARAM wParam,  // first message parameter
	//    LPARAM lParam   // second message parameter
	//);
	//
	//HDWP DeferWindowPos(
	//    HDWP hWinPosInfo,      // handle to internal structure
	//    HWND hWnd,             // handle to window to position
	//    HWND hWndInsertAfter,  // placement-order handle
	//    int x,                 // horizontal position
	//    int y,                 // vertical position
	//    int cx,                // width
	//    int cy,                // height
	//    UINT uFlags            // window-positioning flags
	//);
	//
	////alias STDWIN.DeleteDC DeleteDC;
	////alias STDWIN.DeleteFileA DeleteFileA;
	//BOOL DeleteMenu(
	//    HMENU hMenu,     // handle to menu
	//    UINT uPosition,  // menu item identifier or position
	//    UINT uFlags      // menu item flag
	//);
	////alias STDWIN.DeleteObject DeleteObject;
	//BOOL DestroyAcceleratorTable(
	//    HACCEL hAccel   // handle to accelerator table
	//);
	//int DestroyCaret();
	//BOOL DestroyCursor(
	//    HCURSOR hCursor   // handle to cursor to destroy
	//);
	//BOOL DestroyIcon(
	//    HICON hIcon   // handle to icon to destroy
	//);
	//BOOL DestroyMenu(
	//    HMENU hMenu  // handle to menu to destroy
	//);
	//BOOL DestroyWindow(
	//    HWND hWnd   // handle to window to destroy
	//);
	//LONG DispatchMessageA(
	//    MSG *lpmsg   // pointer to structure with message
	//);
	//LONG DispatchMessageW(
	//    MSG *lpmsg   // pointer to structure with message
	//);
	//BOOL DragDetect(
	//    HWND hwnd,
	//    POINT pt
	//);
	//void DragFinish(
	//    HDROP hDrop
	//);
	//UINT DragQueryFileA(
	//    HDROP hDrop,
	//    UINT iFile,
	//    LPSTR lpszFile,
	//    UINT cch
	//);
	//UINT DragQueryFileW(
	//    HDROP hDrop,
	//    UINT iFile,
	//    LPWSTR lpszFile,
	//    UINT cch
	//);
	//BOOL DrawEdge(
	//    HDC hdc,       // handle to device context
	//    LPRECT qrc,    // pointer to rectangle coordinates
	//    UINT edge,     // type of inner and outer edge to draw
	//    UINT grfFlags  // type of border
	//);
	//BOOL DrawFocusRect(
	//    HDC hDC,          // handle to device context
	//    RECT *lprc  // pointer to structure for rectangle
	//);
	//BOOL DrawFrameControl(
	//    HDC hdc,     // handle to device context
	//    LPRECT lprc, // pointer to bounding rectangle
	//    UINT uType,  // frame-control type
	//    UINT uState  // frame-control state
	//);
	//BOOL DrawIconEx(
	//    HDC hdc,                    // handle to device context
	//    int xLeft,                  // x-coordinate of upper left corner
	//    int yTop,                   // y-coordinate of upper left corner
	//    HICON hIcon,                // handle to icon to draw
	//    int cxWidth,                // width of the icon
	//    int cyWidth,                // height of the icon
	//    UINT istepIfAniCur,         // index of frame in animated cursor
	//    HBRUSH hbrFlickerFreeDraw,  // handle to background brush
	//    UINT diFlags                // icon-drawing flags
	//);
	//BOOL DrawMenuBar(
	//    HWND hWnd  // handle to window with menu bar to redraw
	//);
	//BOOL DrawStateA(
	//    HDC hdc,                     // handle to device context
	//    HBRUSH hbr,                  // handle to brush
	//    DRAWSTATEPROC lpOutputFunc,  // pointer to callback function
	//    LPARAM lData,                // image information
	//    WPARAM wData,                // more image information
	//    int x,                       // horizontal location of image
	//    int y,                       // vertical location of image
	//    int cx,                      // width of image
	//    int cy,                      // height of image
	//    UINT fuFlags                 // image type and state
	//);
	//BOOL DrawStateW(
	//    HDC hdc,                     // handle to device context
	//    HBRUSH hbr,                  // handle to brush
	//    DRAWSTATEPROC lpOutputFunc,  // pointer to callback function
	//    LPARAM lData,                // image information
	//    WPARAM wData,                // more image information
	//    int x,                       // horizontal location of image
	//    int y,                       // vertical location of image
	//    int cx,                      // width of image
	//    int cy,                      // height of image
	//    UINT fuFlags                 // image type and state
	//);
	//int DrawTextA(
	//    HDC hDC,          // handle to device context
	//    LPCSTR lpString, // pointer to string to draw
	//    int nCount,       // string length, in characters
	//    LPRECT lpRect,    // pointer to struct with formatting dimensions
	//    UINT uFormat      // text-drawing flags
	//);
	//int DrawTextW(
	//    HDC hDC,          // handle to device context
	//    LPCWSTR lpString, // pointer to string to draw
	//    int nCount,       // string length, in characters
	//    LPRECT lpRect,    // pointer to struct with formatting dimensions
	//    UINT uFormat      // text-drawing flags
	//);
	//
	//BOOL Ellipse(
	//    HDC hdc,        // handle to device context
	//    int nLeftRect,  // x-coord of bounding rectangle's upper-left corner
	//    int nTopRect,   // y-coord of bounding rectangle's upper-left corner
	//    int nRightRect, // x-coord of bounding rectangle's lower-right corner
	//    int nBottomRect // y-coord of bounding rectangle's lower-right corner
	//);
	//BOOL EnableMenuItem(
	//    HMENU hMenu,         // handle to menu
	//    UINT uIDEnableItem,  // menu item to enable, disable, or gray
	//    UINT uEnable         // menu item flags
	//);
	//BOOL EnableWindow(
	//    HWND hWnd,
	//    BOOL bEnable
	//);
	//BOOL EndDeferWindowPos(
	//    HDWP hWinPosInfo   // handle to internal structure
	//);
	//int EndDoc(HDC hDC);
	//int EndPage(HDC hDC);
	//BOOL EnumDisplayMonitors(
	//    HDC hdc,                   // handle to display DC
	//    LPCRECT lprcClip,          // clipping rectangle
	//    MONITORENUMPROC lpfnEnum,  // callback function
	//    LPARAM dwData              // data for callback function
	//);
	//int EnumFontFamiliesExA(
	//    HDC hdc,              // handle to device context
	//    LPLOGFONTA lpLogfont,  // pointer to logical font information
	//    FONTENUMEXPROC lpEnumFontFamExProc,
	//                    // pointer to callback function
	//    LPARAM lParam,        // application-supplied data
	//    DWORD dwFlags         // reserved; must be zero
	//);
	//int EnumFontFamiliesExW(
	//    HDC hdc,              // handle to device context
	//    LPLOGFONTW lpLogfont,  // pointer to logical font information
	//    FONTENUMEXPROC lpEnumFontFamExProc,
	//                    // pointer to callback function
	//    LPARAM lParam,        // application-supplied data
	//    DWORD dwFlags         // reserved; must be zero
	//);
	//
	//int EnumFontFamiliesA(
	//    HDC hdc,             // handle to device control
	//    LPCSTR lpszFamily,  // pointer to family-name string
	//    FONTENUMPROC lpEnumFontFamProc,
	//                   // pointer to callback function
	//    LPARAM lParam        // pointer to application-supplied data
	//);
	//int EnumFontFamiliesW(
	//    HDC hdc,             // handle to device control
	//    LPCWSTR lpszFamily,  // pointer to family-name string
	//    FONTENUMPROC lpEnumFontFamProc,
	//                   // pointer to callback function
	//    LPARAM lParam        // pointer to application-supplied data
	//);
	//BOOL EqualRect(
	//    RECT *lprc1,  // pointer to structure with first rectangle
	//    RECT *lprc2   // pointer to structure with second rectangle
	//);
	//BOOL EqualRgn(
	//    HRGN hSrcRgn1,  // handle to first region
	//    HRGN hSrcRgn2   // handle to second region
	//);
	//DWORD ExpandEnvironmentStringsA(
	//    LPCSTR lpSrc, // pointer to string with environment variables
	//    LPSTR lpDst,  // pointer to string with expanded environment
	//             // variables
	//    DWORD nSize    // maximum characters in expanded string
	//);
	//DWORD ExpandEnvironmentStringsW(
	//    LPCWSTR lpSrc, // pointer to string with environment variables
	//    LPWSTR lpDst,  // pointer to string with expanded environment
	//             // variables
	//    DWORD nSize    // maximum characters in expanded string
	//);
	//BOOL ExtTextOutA(
	//    HDC hdc,          // handle to device context
	//    int X,            // x-coordinate of reference point
	//    int Y,            // y-coordinate of reference point
	//    UINT fuOptions,   // text-output options
	//    RECT *lprc, // optional clipping and/or opaquing rectangle
	//    LPCSTR lpString, // points to string
	//    UINT cbCount,     // number of characters in string
	//    INT *lpDx   // pointer to array of intercharacter spacing
	//                // values
	//);
	//BOOL ExtTextOutW(
	//    HDC hdc,          // handle to device context
	//    int X,            // x-coordinate of reference point
	//    int Y,            // y-coordinate of reference point
	//    UINT fuOptions,   // text-output options
	//    RECT *lprc, // optional clipping and/or opaquing rectangle
	//    LPCWSTR lpString, // points to string
	//    UINT cbCount,     // number of characters in string
	//    INT *lpDx   // pointer to array of intercharacter spacing
	//                // values
	//);
	UINT ExtractIconExA(LPCSTR lpszFile, int nIconIndex, HICON* phiconLarge,
			HICON* phiconSmall, UINT nIcons);
	UINT ExtractIconExW(LPCWSTR lpszFile, int nIconIndex, HICON* phiconLarge,
			HICON* phiconSmall, UINT nIcons);
	//HRSRC FindResourceA(
	//    HMODULE hModule, // module handle
	//    LPCSTR lpName,  // pointer to resource name
	//    LPCSTR lpType   // pointer to resource type
	//);
	//HRSRC FindResourceW(
	//    HMODULE hModule, // module handle
	//    LPCWSTR lpName,  // pointer to resource name
	//    LPCWSTR lpType   // pointer to resource type
	//);
	//HWND FindWindowA(
	//    LPCSTR lpClassName,  // pointer to class name
	//    LPCSTR lpWindowName  // pointer to window name
	//);
	//HWND FindWindowW(
	//    LPCWSTR lpClassName,  // pointer to class name
	//    LPCWSTR lpWindowName  // pointer to window name
	//);
	//DWORD FormatMessageA(
	//    DWORD dwFlags,      // source and processing options
	//    LPCVOID lpSource,   // pointer to  message source
	//    DWORD dwMessageId,  // requested message identifier
	//    DWORD dwLanguageId, // language identifier for requested message
	//    LPSTR lpBuffer,    // pointer to message buffer
	//    DWORD nSize,        // maximum size of message buffer
	//    //  va_list *Arguments  // pointer to array of message inserts
	//    void* Arguments
	//);
	//DWORD FormatMessageW(
	//    DWORD dwFlags,      // source and processing options
	//    LPCVOID lpSource,   // pointer to  message source
	//    DWORD dwMessageId,  // requested message identifier
	//    DWORD dwLanguageId, // language identifier for requested message
	//    LPWSTR lpBuffer,    // pointer to message buffer
	//    DWORD nSize,        // maximum size of message buffer
	//    //  va_list *Arguments  // pointer to array of message inserts
	//    void* Arguments
	//);
	//DWORD GdiSetBatchLimit(
	//    DWORD dwLimit   // batch limit
	//);
	//UINT GetACP();
	//HWND GetActiveWindow();
	//COLORREF GetBkColor(
	//    HDC hdc   // handle of device context
	//);
	//HWND GetCapture();
	//BOOL GetCaretPos(
	//    LPPOINT lpPoint   // address of structure to receive coordinates
	//);
	//BOOL GetCharABCWidthsA(
	//    HDC hdc,         // handle to device context
	//    UINT uFirstChar, // first character in range to query
	//    UINT uLastChar,  // last character in range to query
	//    LPABC lpabc      // pointer to character-width structure
	//);
	//BOOL GetCharABCWidthsW(
	//    HDC hdc,         // handle to device context
	//    UINT uFirstChar, // first character in range to query
	//    UINT uLastChar,  // last character in range to query
	//    LPABC lpabc      // pointer to character-width structure
	//);
	//
	//BOOL GetCharWidthA(
	//    HDC hdc,         // handle to device context
	//    UINT iFirstChar, // first character in range to query
	//    UINT iLastChar,  // last character in range to query
	//    LPINT lpBuffer   // pointer to buffer for widths
	//);
	//BOOL GetCharWidthW(
	//    HDC hdc,         // handle to device context
	//    UINT iFirstChar, // first character in range to query
	//    UINT iLastChar,  // last character in range to query
	//    LPINT lpBuffer   // pointer to buffer for widths
	//);
	//DWORD GetCharacterPlacementA(
	//    HDC hdc,           // handle to device context
	//    LPCSTR lpString,  // pointer to string
	//    int nCount,        // number of characters in string
	//    int nMaxExtent,    // maximum extent for displayed string
	//    LPGCP_RESULTS lpResults,
	//                     // pointer to buffer for placement result
	//    DWORD dwFlags      // placement flags
	//);
	//DWORD GetCharacterPlacementW(
	//    HDC hdc,           // handle to device context
	//    LPCWSTR lpString,  // pointer to string
	//    int nCount,        // number of characters in string
	//    int nMaxExtent,    // maximum extent for displayed string
	//    LPGCP_RESULTS lpResults,
	//                     // pointer to buffer for placement result
	//    DWORD dwFlags      // placement flags
	//);
	//BOOL GetClassInfoA(
	//    HINSTANCE hInstance,    // handle of application instance
	//    LPCSTR lpClassName,    // address of class name string
	//    LPWNDCLASSA lpWndClass   // address of structure for class data
	//);
	//BOOL GetClassInfoW(
	//    HINSTANCE hInstance,    // handle of application instance
	//    LPCWSTR lpClassName,    // address of class name string
	//    LPWNDCLASSW lpWndClass   // address of structure for class data
	//);
	//alias STDWIN.GetClientRect GetClientRect;
	//alias STDWIN.GetClipBox GetClipBox;
	//alias STDWIN.GetClipRgn GetClipRgn;
	//HANDLE GetClipboardData(
	//    UINT uFormat   // clipboard format
	//);
	//int GetClipboardFormatNameA(
	//    UINT format,            // clipboard format to retrieve
	//    LPSTR lpszFormatName,  // address of buffer for name
	//    int cchMaxCount         // length of name string in characters
	//);
	//int GetClipboardFormatNameW(
	//    UINT format,            // clipboard format to retrieve
	//    LPWSTR lpszFormatName,  // address of buffer for name
	//    int cchMaxCount         // length of name string in characters
	//);
	BOOL GetComboBoxInfo(HWND hwndCombo, PCOMBOBOXINFO pcbi);
	//alias STDWIN.GetCurrentObject GetCurrentObject;
	//DWORD GetCurrentProcessId();
	//DWORD GetCurrentThreadId();
	//HCURSOR GetCursor();
	//BOOL GetCursorPos(
	//    LPPOINT lpPoint   // address of structure for cursor position
	//);
	//alias STDWIN.GetDC GetDC;
	//UINT GetDIBColorTable(
	//    HDC hdc,          // handle to device context whose DIB is of
	//                // interest
	//    UINT uStartIndex, // color table index of first entry to retrieve
	//    UINT cEntries,    // number of color table entries to retrieve
	//    RGBQUAD *pColors  // pointer to buffer that receives color table
	//                // entries
	//);
	//int GetDIBits(
	//    HDC hdc,           // handle to device context
	//    HBITMAP hbmp,      // handle to bitmap
	//    UINT uStartScan,   // first scan line to set in destination bitmap
	//    UINT cScanLines,   // number of scan lines to copy
	//    LPVOID lpvBits,    // address of array for bitmap bits
	//    LPBITMAPINFO lpbi, // address of structure with bitmap data
	//    UINT uUsage        // RGB or palette index
	//);
	//HWND GetDesktopWindow();
	//int GetDialogBaseUnits();
	//int GetDoubleClickTime();
	//DWORD GetFontLanguageInfo(
	//    HDC hdc  // handle to a device context
	//);
	BOOL GetGUIThreadInfo(DWORD idThread, LPGUITHREADINFO lpgui);
	//BOOL GetIconInfo(
	//    HICON hIcon,          // icon handle
	//    PICONINFO piconinfo   // address of icon structure
	//);
	//int GetKeyNameTextA(
	//    LONG lParam,      // second parameter of keyboard message
	//    LPSTR lpString,  // pointer to buffer for key name
	//    int nSize         // maximum length of key-name string length
	//);
	//int GetKeyNameTextW(
	//    LONG lParam,      // second parameter of keyboard message
	//    LPWSTR lpString,  // pointer to buffer for key name
	//    int nSize         // maximum length of key-name string length
	//);
	//HKL GetKeyboardLayout(
	//    DWORD dwLayout  // thread identifier
	//);
	//SHORT GetKeyState(
	//    int nVirtKey   // virtual-key code
	//);
	//UINT GetKeyboardLayoutList(
	//    int nBuff,       // size of buffer in array element
	//    HKL *lpList  // buffer for keyboard layout handles
	//);
	//BOOL GetKeyboardState(
	//    PBYTE lpKeyState   // pointer to array to receive status data
	//);
	//HWND GetLastActivePopup(HWND hWnd);
	//DWORD GetLastError();
	DWORD GetLayout(HDC hdc // handle to DC
	);
	//int GetLocaleInfoA(
	//    LCID Locale,      // locale identifier
	//    LCTYPE LCType,    // type of information
	//    LPSTR lpLCData,  // address of buffer for information
	//    int cchData       // size of buffer
	//);
	//int GetLocaleInfoW(
	//    LCID Locale,      // locale identifier
	//    LCTYPE LCType,    // type of information
	//    LPWSTR lpLCData,  // address of buffer for information
	//    int cchData       // size of buffer
	//);
	//HMENU GetMenu(
	//    HWND hWnd  // handle to window
	//);
	BOOL GetMenuBarInfo(HWND hwnd, LONG idObject, LONG idItem, PMENUBARINFO pmbi);
	//UINT GetMenuDefaultItem(
	//    HMENU hMenu,
	//    UINT fByPos,
	//    UINT gmdiFlags
	//);
	BOOL GetMenuInfo(HMENU hmenu, LPCMENUINFO lpcmi);
	//int GetMenuItemCount(HMENU hMenu);
	//BOOL GetMenuItemInfoA(
	//    HMENU hMenu,
	//    UINT uItem,
	//    BOOL fByPosition,
	//    LPMENUITEMINFO lpmii
	//);
	//BOOL GetMenuItemInfoW(
	//    HMENU hMenu,
	//    UINT uItem,
	//    BOOL fByPosition,
	//    LPMENUITEMINFO lpmii
	//);
	//BOOL GetMenuItemRect(
	//    HWND hWnd,
	//    HMENU hMenu,
	//    UINT uItem,
	//    LPRECT lprcItem
	//);
	//BOOL GetMessageW(
	//    LPMSG lpMsg,         // address of structure with message
	//    HWND hWnd,           // handle of window
	//    UINT wMsgFilterMin,  // first message
	//    UINT wMsgFilterMax   // last message
	//);
	//DWORD GetMessagePos();
	//LONG GetMessageTime();
	//DWORD GetModuleFileNameA(
	//    HMODULE hModule,    // handle to module to find filename for
	//    LPSTR lpFilename,  // pointer to buffer to receive module path
	//    DWORD nSize         // size of buffer, in characters
	//);
	//DWORD GetModuleFileNameW(
	//    HMODULE hModule,    // handle to module to find filename for
	//    LPWSTR lpFilename,  // pointer to buffer to receive module path
	//    DWORD nSize         // size of buffer, in characters
	//);
	//HMODULE GetModuleHandleW(
	//  LPCWSTR lpModuleName
	//);
	//BOOL GetMonitorInfoA(
	//    HMONITOR hMonitor,  // handle to display monitor
	//    LPMONITORINFO lpmi  // pointer to display monitor information
	//);
	BOOL GetMonitorInfoW(HMONITOR hMonitor, // handle to display monitor
			LPMONITORINFO lpmi // pointer to display monitor information
			);
	//UINT GetNearestPaletteIndex(
	//    HPALETTE hpal,     // handle of logical color palette
	//    COLORREF crColor   // color to be matched
	//);
	//BOOL GetOpenFileNameA(
	//    OPENFILENAMEA* lpofn   // address of structure with initialization data
	//);
	//BOOL GetOpenFileNameW(
	//    OPENFILENAMEW* lpofn   // address of structure with initialization data
	//);
	//UINT GetPaletteEntries(
	//  HPALETTE hpal,        // handle to logical palette
	//  UINT iStartIndex,     // first entry to retrieve
	//  UINT nEntries,        // number of entries to retrieve
	//  LPPALETTEENTRY lppe   // array that receives entries
	//);
	//HWND GetParent(
	//    HWND hWnd   // handle to child window
	//);
	//
	//COLORREF GetPixel(
	//    HDC hdc,   // handle to device context
	//    int XPos,  // x-coordinate of pixel
	//    int nYPos  // y-coordinate of pixel
	//);
	//HANDLE GetProcessHeap();
	//DWORD GetProfileStringA(
	//    LPCSTR lpAppName,        // address of section name
	//    LPCSTR lpKeyName,        // address of key name
	//    LPCSTR lpDefault,        // address of default string
	//    LPSTR lpReturnedString,  // address of destination buffer
	//    DWORD nSize               // size of destination buffer
	//);
	//DWORD GetProfileStringW(
	//    LPCWSTR lpAppName,        // address of section name
	//    LPCWSTR lpKeyName,        // address of key name
	//    LPCWSTR lpDefault,        // address of default string
	//    LPWSTR lpReturnedString,  // address of destination buffer
	//    DWORD nSize               // size of destination buffer
	//);
	//int GetROP2(
	//    HDC hdc   // handle of device context
	//);
	int GetRandomRgn(HDC hdc, // handle to DC
			HRGN hrgn, // handle to region
			INT iNum // must be SYSRGN
			);
	//DWORD GetRegionData(
	//    HRGN hRgn,            // handle to region
	//    DWORD dwCount,        // size of buffer containing region data
	//    LPRGNDATA lpRgnData   // pointer to region data
	//);
	//int GetRgnBox(
	//    HRGN hrgn,   // handle to a region
	//    LPRECT lprc  // pointer that receives bounding rectangle
	//);
	//BOOL GetSaveFileNameA(
	//    OPENFILENAMEA* lpofn   // address of structure with initialization data
	//);
	//BOOL GetSaveFileNameW(
	//    OPENFILENAME* lpofn   // address of structure with initialization data
	//);
	//BOOL GetScrollInfo(
	//    HWND hwnd,         // handle to window with scroll bar
	//    int fnBar,         // scroll bar flag
	//    LPSCROLLINFO lpsi  // pointer to structure for scroll parameters
	//);
	////alias STDWIN.GetStockObject GetStockObject;
	//DWORD GetSysColor(
	//    int nIndex   // display element
	//);
	//HBRUSH GetSysColorBrush(
	//    int nIndex  // system color index
	//);
	//HMENU GetSystemMenu(
	//    HWND hWnd,    // handle to window to own window menu
	//    BOOL bRevert  // reset flag
	//);
	//int GetSystemMetrics(
	//    int nIndex   // system metric or configuration setting to retrieve
	//);
	//UINT GetSystemPaletteEntries(
	//    HDC hdc,              // handle of device context
	//    UINT iStartIndex,     // index of first entry to be retrieved
	//    UINT nEntries,        // number of entries to be retrieved
	//    LPPALETTEENTRY lppe   // array receiving system-palette entries
	//);
	//int GetTextCharset(
	//    HDC hdc  // handle to DC
	//);
	//COLORREF GetTextColor(
	//    HDC hdc   // handle to device context
	//);
	//BOOL GetTextExtentPoint32A(
	//    HDC hdc,           // handle to device context
	//    LPCSTR lpString,  // pointer to text string
	//    int cbString,      // number of characters in string
	//    LPSIZE lpSize      // pointer to structure for string size
	//);
	//BOOL GetTextExtentPoint32W(
	//    HDC hdc,           // handle to device context
	//    LPCWSTR lpString,  // pointer to text string
	//    int cbString,      // number of characters in string
	//    LPSIZE lpSize      // pointer to structure for string size
	//);
	//BOOL GetTextMetricsW(
	//    HDC hdc,            // handle to device context
	//    TEXTMETRICW* lptm   // pointer to text metrics structure
	//);
	//DWORD GetTickCount();
	////alias STDWIN.GetUpdateRect GetUpdateRect;
	////alias STDWIN.GetUpdateRgn GetUpdateRgn;
	//DWORD GetVersion();
	//BOOL GetVersionExA(
	//    LPOSVERSIONINFOA lpVersionInformation   // pointer to version information structure
	//);
	//BOOL GetVersionExW(
	//    LPOSVERSIONINFOW lpVersionInformation   // pointer to version information structure
	//);
	//HWND GetWindow(
	//    HWND hWnd,  // handle to original window
	//    UINT uCmd   // relationship flag
	//);
	//LONG GetWindowLongA(HWND hWnd, int nIndex);
	//LONG GetWindowLongW(HWND hWnd, int nIndex);
	//
	//BOOL GetWindowPlacement(
	//    HWND hWnd,
	//    WINDOWPLACEMENT *lpwndpl
	//);
	//int GetWindowTextA(
	//  HWND hWnd,        // handle to window or control with text
	//  LPSTR lpString,  // address of buffer for text
	//  int nMaxCount     // maximum number of characters to copy
	//);
	//int GetWindowTextW(
	//  HWND hWnd,        // handle to window or control with text
	//  LPWSTR lpString,  // address of buffer for text
	//  int nMaxCount     // maximum number of characters to copy
	//);
	//int GetWindowTextLengthA(HWND hWnd);
	//int GetWindowTextLengthW(HWND hWnd);
	//DWORD GetWindowThreadProcessId(
	//  HWND hWnd,             // handle to window
	//  LPDWORD lpdwProcessId  // address of variable for process identifier
	//);
	//HGLOBAL GlobalAlloc(UINT uFlags, SIZE_T dwBytes);
	//HGLOBAL GlobalFree(HGLOBAL hMem);
	//LPVOID GlobalLock(HGLOBAL hMem);
	//SIZE_T GlobalSize(HGLOBAL hMem);
	//BOOL GlobalUnlock(HGLOBAL hMem);
	BOOL GradientFill(HDC hdc, PTRIVERTEX pVertex, DWORD dwNumVertex, PVOID pMesh,
			DWORD dwNumMesh, DWORD dwMode);
	//LPVOID HeapAlloc(
	//    HANDLE hHeap,  // handle to the private heap block
	//    DWORD dwFlags, // heap allocation control flags
	//    SIZE_T dwBytes  // number of bytes to allocate
	//);
	//BOOL HeapFree(
	//    HANDLE hHeap,  // handle to the heap
	//    DWORD dwFlags, // heap freeing flags
	//    LPVOID lpMem   // pointer to the memory to free
	//);
	//alias STDWIN.HideCaret HideCaret;
	//int ImageList_Add(
	//    HIMAGELIST himl,
	//    HBITMAP hbmImage,
	//    HBITMAP hbmMask
	//);
	//int ImageList_AddMasked(
	//    HIMAGELIST himl,
	//    HBITMAP hbmImage,
	//    COLORREF crMask
	//     );
	//HIMAGELIST ImageList_Create(
	//    int cx,
	//    int cy,
	//    UINT flags,
	//    int cInitial,
	//    int cGrow
	//);
	//BOOL ImageList_Destroy(
	//    HIMAGELIST himl
	//);
	//HICON ImageList_GetIcon(
	//    HIMAGELIST himl,
	//    int i,
	//    UINT flags
	//);
	//BOOL ImageList_GetIconSize(
	//    HIMAGELIST himl,
	//    int *cx,
	//    int *cy
	//);
	//int ImageList_GetImageCount(
	//    HIMAGELIST himl
	//);
	//BOOL ImageList_Remove(
	//    HIMAGELIST himl,
	//    int i
	//);
	//BOOL ImageList_Replace(
	//    HIMAGELIST himl,
	//    int i,
	//    HBITMAP hbmImage,
	//    HBITMAP hbmMask
	//);
	//int ImageList_ReplaceIcon(
	//    HIMAGELIST himl,
	//    int i,
	//    HICON hicon
	//);
	//BOOL ImageList_SetIconSize(
	//    HIMAGELIST himl,
	//    int cx,
	//    int cy
	//);
	HIMC ImmAssociateContext(HWND hWnd, HIMC hIMC);
	HIMC ImmCreateContext();
	int ImmDestroyContext(HIMC hIMC);
	BOOL ImmGetCompositionFontA(HIMC hIMC, LPLOGFONTA lplf);
	BOOL ImmGetCompositionFontW(HIMC hIMC, LOGFONTW* lplf);
	LONG ImmGetCompositionStringA(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen);
	LONG ImmGetCompositionStringW(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen);
	HIMC ImmGetContext(HWND hWnd);
	BOOL ImmGetConversionStatus(HIMC hIMC, LPDWORD lpfdwConversion, LPDWORD lpfdwSentence);
	HWND ImmGetDefaultIMEWnd(HWND hWnd);
	BOOL ImmGetOpenStatus(HIMC hIMC);
	BOOL ImmReleaseContext(HWND hWnd, HIMC hIMC);
	BOOL ImmSetCompositionFontA(HIMC hIMC, LOGFONTA* lplf);
	BOOL ImmSetCompositionFontW(HIMC hIMC, LOGFONTW* lplf);
	BOOL ImmSetCompositionWindow(HIMC hIMC, LPCOMPOSITIONFORM lpCompForm);
	BOOL ImmSetConversionStatus(HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence);
	BOOL ImmSetOpenStatus(HIMC hIMC, BOOL fOpen);
	//void InitCommonControls();
	BOOL InitCommonControlsEx(LPINITCOMMONCONTROLSEX lpInitCtrls);
	//BOOL InsertMenuA(
	//  HMENU hMenu,      // handle to menu
	//  UINT uPosition,   // menu item that new menu item precedes
	//  UINT uFlags,      // menu item flags
	//  UINT_PTR uIDNewItem,  // menu item identifier or handle to drop-down
	//                    // menu or submenu
	//  LPCSTR lpNewItem // menu item content
	//);
	//BOOL InsertMenuW(
	//  HMENU hMenu,      // handle to menu
	//  UINT uPosition,   // menu item that new menu item precedes
	//  UINT uFlags,      // menu item flags
	//  UINT_PTR uIDNewItem,  // menu item identifier or handle to drop-down
	//                    // menu or submenu
	//  LPCWSTR lpNewItem // menu item content
	//);
	//
	//BOOL InsertMenuItemA(
	//  HMENU hMenu,
	//  UINT uItem,
	//  BOOL fByPosition,
	//  MENUITEMINFOA* lpmii
	//);
	//BOOL InsertMenuItemW(
	//  HMENU hMenu,
	//  UINT uItem,
	//  BOOL fByPosition,
	//  MENUITEMINFOW* lpmii
	//);
	//BOOL IntersectRect(
	//    LPRECT lprcDst,        // pointer to structure for intersection
	//    RECT *lprcSrc1,  // pointer to structure with first rectangle
	//    RECT *lprcSrc2   // pointer to structure with second rectangle
	//);
	//LONG InterlockedIncrement(
	//    LPLONG lpAddend   // pointer to the variable to increment
	//);
	//LONG InterlockedDecrement(
	//    LPLONG lpAddend   // address of the variable to decrement
	//);
	//BOOL IsDBCSLeadByte(
	//    BYTE TestChar   // character to test
	//);
	//BOOL IsIconic(
	//    HWND hWnd   // handle to window
	//);
	//BOOL IsWindow(
	//    HWND hWnd   // handle to window
	//);
	//BOOL IsWindowEnabled(HWND hWnd);
	//BOOL IsWindowVisible(HWND hWnd);
	//BOOL IsZoomed(HWND hWnd);
	//BOOL KillTimer(
	//    HWND hWnd,      // handle of window that installed timer
	//    UINT uIDEvent   // timer identifier
	//);
	//alias STDWIN.LineTo LineTo;
	//HBITMAP LoadBitmapA(
	//    HINSTANCE hInstance,  // handle to application instance
	//    LPCSTR lpBitmapName  // name of bitmap resource
	//);
	//HBITMAP LoadBitmapW(
	//    HINSTANCE hInstance,  // handle to application instance
	//    LPCWSTR lpBitmapName  // name of bitmap resource
	//);
	//HANDLE LoadImageA(
	//    HINSTANCE hinst,   // handle of the instance containing the image
	//    LPCSTR lpszName,  // name or identifier of image
	//    UINT uType,        // type of image
	//    int cxDesired,     // desired width
	//    int cyDesired,     // desired height
	//    UINT fuLoad        // load flags
	//);
	//HANDLE LoadImageW(
	//    HINSTANCE hinst,   // handle of the instance containing the image
	//    LPCWSTR lpszName,  // name or identifier of image
	//    UINT uType,        // type of image
	//    int cxDesired,     // desired width
	//    int cyDesired,     // desired height
	//    UINT fuLoad        // load flags
	//);
	//HINSTANCE LoadLibraryW(wchar* lpLibFileName );
	//HGLOBAL LoadResource(
	//    HMODULE hModule, // resource-module handle
	//    HRSRC hResInfo   // resource handle
	//);
	//int LoadStringA(
	//    HINSTANCE hInstance,
	//    UINT uID,
	//    LPSTR lpBuffer,
	//    int nBufferMax
	//);
	//int LoadStringW(
	//    HINSTANCE hInstance,
	//    UINT uID,
	//    LPWSTR lpBuffer,
	//    int nBufferMax
	//);
	//HLOCAL LocalFree(
	//    HLOCAL hMem   // handle to local memory object
	//);
	//LPVOID LockResource(
	//    HGLOBAL hResData   // handle to resource to lock
	//);
	//UINT MapVirtualKeyA(
	//    UINT uCode,     // virtual-key code or scan code
	//    UINT uMapType   // translation to perform
	//);
	//UINT MapVirtualKeyW(
	//    UINT uCode,     // virtual-key code or scan code
	//    UINT uMapType   // translation to perform
	//);
	//BOOL MessageBeep(
	//    UINT uType   // sound type
	//);
	//int MessageBoxW(
	//    HWND hWnd,          // handle of owner window
	//    LPCWSTR lpText,     // address of text in message box
	//    LPCWSTR lpCaption,  // address of title of message box
	//    UINT uType          // style of message box
	//);
	HMONITOR MonitorFromWindow(HWND hwnd, // handle to a window
			DWORD dwFlags // flags if no monitor intersects the window
			);
	DWORD MsgWaitForMultipleObjectsEx(DWORD nCount, // number of handles in handle array
			LPHANDLE pHandles, // pointer to an object-handle array
			DWORD dwMilliseconds, // time-out interval in milliseconds
			DWORD dwWakeMask, // type of input events to wait for
			DWORD dwFlags // wait flags
			);
	void NotifyWinEvent(DWORD event, HWND hwnd, LONG idObject, LONG idChild);
	//int OffsetRgn(
	//    HRGN hrgn,     // handle to region
	//    int nXOffset,  // offset along x-axis
	//    int nYOffset   // offset along y-axis
	//);
	WINOLEAPI OleInitialize(LPVOID pvReserved //Reserved; must be NULL.
	);
	void OleUninitialize();
	//BOOL OpenClipboard(
	//    HWND hWndNewOwner
	//);
	//void OutputDebugStringA(
	//    LPCSTR lpOutputString
	//);
	//void OutputDebugStringW(
	//    LPCWSTR lpOutputString
	//);
	//BOOL PatBlt(
	//    HDC hdc,     // handle to device context
	//    int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
	//    int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
	//    int nWidth,  // width of rectangle to be filled
	//    int nHeight, // height of rectangle to be filled
	//    DWORD dwRop  // raster operation code
	//);
	//BOOL PeekMessageW(
	//    LPMSG lpMsg,         // pointer to structure for message
	//    HWND hWnd,           // handle to window
	//    UINT wMsgFilterMin,  // first message
	//    UINT wMsgFilterMax,  // last message
	//    UINT wRemoveMsg      // removal flags
	//);
	//BOOL Pie(
	//    HDC hdc,         // handle to device context
	//    int nLeftRect,   // x-coord of bounding rectangle's upper-left corner
	//    int nTopRect,    // y-coord of bounding rectangle's upper-left corner
	//    int nRightRect,  // x-coord of bounding rectangle's lower-right corner
	//    int nBottomRect, // y-coord of bounding rectangle's lower-right corner
	//    int nXRadial1,   // x-coord of first radial's endpoint
	//    int nYRadial1,   // y-coord of first radial's endpoint
	//    int nXRadial2,   // x-coord of second radial's endpoint
	//    int nYRadial2    // y-coord of second radial's endpoint
	//);
	//BOOL Polygon(
	//    HDC hdc,                // handle to device context
	//    POINT *lpPoints,  // pointer to polygon's vertices
	//    int nCount              // count of polygon's vertices
	//);
	//BOOL Polyline(
	//    HDC hdc,            // handle to device context
	//    POINT *lppt,  // pointer to array containing endpoints
	//    int cPoints         // number of points in the array
	//);
	//BOOL PostMessageA(
	//    HWND hWnd,
	//    UINT Msg,
	//    WPARAM wParam,
	//    LPARAM lParam
	//);
	//BOOL PostMessageW(
	//    HWND hWnd,
	//    UINT Msg,
	//    WPARAM wParam,
	//    LPARAM lParam
	//);
	//BOOL PostThreadMessageA(
	//    DWORD idThread,
	//    UINT Msg,
	//    WPARAM wParam,
	//    LPARAM lParam
	//);
	//BOOL PostThreadMessageW(
	//    DWORD idThread,
	//    UINT Msg,
	//    WPARAM wParam,
	//    LPARAM lParam
	//);
	//BOOL PtInRect(
	//    RECT *lprc,  // rectangle
	//    POINT pt           // point
	//);
	//BOOL PtInRegion(
	//    HRGN hrgn,  // handle to region
	//    int X,      // x-coordinate of point
	//    int Y       // y-coordinate of point
	//);
	//UINT RealizePalette(
	//    HDC hdc   // handle of device context
	//);
	//BOOL RectInRegion(
	//    HRGN hrgn,         // handle to region
	//    RECT *lprc   // pointer to rectangle
	//);
	//BOOL Rectangle(
	//    HDC hdc,         // handle to device context
	//    int nLeftRect,   // x-coord of bounding rectangle's upper-left corner
	//    int nTopRect,    // y-coord of bounding rectangle's upper-left corner
	//    int nRightRect,  // x-coord of bounding rectangle's lower-right corner
	//    int nBottomRect  // y-coord of bounding rectangle's lower-right corner
	//);
	////alias STDWIN.RedrawWindow RedrawWindow;
	//LONG RegCloseKey(
	//  HKEY hKey
	//);
	//LONG RegEnumKeyExA(
	//  HKEY hKey,
	//  DWORD dwIndex,
	//  LPSTR lpName,
	//  LPDWORD lpcName,
	//  LPDWORD lpReserved,
	//  LPSTR lpClass,
	//  LPDWORD lpcClass,
	//  PFILETIME lpftLastWriteTime
	//);
	//LONG RegEnumKeyExW(
	//  HKEY hKey,
	//  DWORD dwIndex,
	//  LPWSTR lpName,
	//  LPDWORD lpcName,
	//  LPDWORD lpReserved,
	//  LPWSTR lpClass,
	//  LPDWORD lpcClass,
	//  PFILETIME lpftLastWriteTime
	//);
	//LONG RegOpenKeyExA(
	//  HKEY hKey,
	//  LPSTR lpSubKey,
	//  DWORD ulOptions,
	//  REGSAM samDesired,
	//  PHKEY phkResult
	//);
	//LONG RegOpenKeyExW(
	//  HKEY hKey,
	//  LPWSTR lpSubKey,
	//  DWORD ulOptions,
	//  REGSAM samDesired,
	//  PHKEY phkResult
	//);
	//
	//LONG RegQueryInfoKeyA(
	//  HKEY hKey,
	//  LPSTR lpClass,
	//  LPDWORD lpcClass,
	//  LPDWORD lpReserved,
	//  LPDWORD lpcSubKeys,
	//  LPDWORD lpcMaxSubKeyLen,
	//  LPDWORD lpcMaxClassLen,
	//  LPDWORD lpcValues,
	//  LPDWORD lpcMaxValueNameLen,
	//  LPDWORD lpcMaxValueLen,
	//  LPDWORD lpcbSecurityDescriptor,
	//  PFILETIME lpftLastWriteTime
	//);
	//LONG RegQueryInfoKeyW(
	//  HKEY hKey,
	//  LPWSTR lpClass,
	//  LPDWORD lpcClass,
	//  LPDWORD lpReserved,
	//  LPDWORD lpcSubKeys,
	//  LPDWORD lpcMaxSubKeyLen,
	//  LPDWORD lpcMaxClassLen,
	//  LPDWORD lpcValues,
	//  LPDWORD lpcMaxValueNameLen,
	//  LPDWORD lpcMaxValueLen,
	//  LPDWORD lpcbSecurityDescriptor,
	//  PFILETIME lpftLastWriteTime
	//);
	//
	//LONG RegQueryValueExA(
	//  HKEY hKey,
	//  LPCSTR lpValueName,
	//  LPDWORD lpReserved,
	//  LPDWORD lpType,
	//  LPBYTE lpData,
	//  LPDWORD lpcbData
	//);
	//LONG RegQueryValueExW(
	//  HKEY hKey,
	//  LPCWSTR lpValueName,
	//  LPDWORD lpReserved,
	//  LPDWORD lpType,
	//  LPBYTE lpData,
	//  LPDWORD lpcbData
	//);
	//
	//ATOM RegisterClassA(
	//    WNDCLASSA *lpWndClass
	//);
	//ATOM RegisterClassW(
	//    WNDCLASSW *lpWndClass
	//);
	//UINT RegisterClipboardFormatA(
	//    LPCSTR lpszFormat
	//);
	//UINT RegisterClipboardFormatW(
	//    LPCWSTR lpszFormat
	//);
	//UINT RegisterWindowMessageA(
	//    LPCSTR lpString
	//);
	//UINT RegisterWindowMessageW(
	//    LPCWSTR lpString
	//);
	//BOOL ReleaseCapture();
	//BOOL RemoveMenu(
	//    HMENU hMenu,
	//    UINT uPosition,
	//    UINT uFlags
	//);
	//BOOL RestoreDC(
	//    HDC hdc,       // handle to DC
	//    int nSavedDC   // restore state
	//);
	//alias STDWIN.RoundRect RoundRect;

	// basic
	void RtlMoveMemory(void* Destination, LPCVOID Source, SIZE_T Length);
	// extends
	void RtlMoveMemory(intptr_t Destination, LPCVOID Source, SIZE_T Length);
	void RtlMoveMemory(void* Destination, intptr_t Source, SIZE_T Length);
	void RtlMoveMemory(intptr_t Destination, intptr_t Source, SIZE_T Length);

	LPITEMIDLIST SHBrowseForFolderA(BROWSEINFOA* lpbi);
	LPITEMIDLIST SHBrowseForFolderW(BROWSEINFOW* lpbi);
	version (WinCE) {
		int SHCreateMenuBar(SHMENUBARINFO* pmb);
	}
	HRESULT SHGetMalloc(//  LPMALLOC *ppMalloc
			LPVOID* ppMalloc);
	version (WinCE) {
		int SHHandleWMSettingChange(HWND hwnd, int wParam, int lParam, void* psai);
		int SHRecognizeGesture(void* shrg);
		void SHSendBackToFocusWindow(int uMsg, int wp, int lp);
		int SHSetAppKeyWndAssoc(byte bVk, HWND hwnd);
		int SHSipPreference(HWND hwnd, int st);
	}

	// USP methods (Unicode Complex Script processor)
	HRESULT ScriptBreak(LPCWSTR pwcChars, int cChars, //length of pwcChars
			SCRIPT_ANALYSIS* psa, SCRIPT_LOGATTR* psla);
	HRESULT ScriptCPtoX(int iCP, //Logical character position in the run.
			BOOL fTrailing, UTF16shift cChars, //Number of characters in the run.
			int cGlyphs,
			WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piAdvance,
			SCRIPT_ANALYSIS* psa, int* piX);
	HRESULT ScriptCacheGetHeight(HDC hdc, SCRIPT_CACHE* psc, long* tmHeight);
	HRESULT ScriptFreeCache(SCRIPT_CACHE* psc);
	HRESULT ScriptGetFontProperties(HDC hdc, SCRIPT_CACHE* psc, SCRIPT_FONTPROPERTIES* sfp);
	HRESULT ScriptGetLogicalWidths(SCRIPT_ANALYSIS* psa, UTF16shift cChars, //Count of the logical code points in the run.
			int cGlyphs,
			int* piGlyphWidth, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piDx);
	HRESULT ScriptGetProperties(SCRIPT_PROPERTIES*** ppSp, int* piNumScripts);
	HRESULT ScriptGetCMap(HDC hdc, SCRIPT_CACHE* psc, LPCWSTR pwcInChars,
			int cChars, //length of pwcChars
			DWORD dwFlags, WORD* pwOutGlyphs);
	HRESULT ScriptStringAnalyse(HDC hdc, LPCVOID pString, //It can be a Unicode string or use the character set from a Windows ANSI code page, as specified by the iCharset parameter.
			int cString, //Length of the string to analyze.
			int cGlyphs, int iCharset,
			DWORD dwFlags, int iReqWidth, SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, int* piDx,
			SCRIPT_TABDEF* pTabdef, BYTE* pbInClass, SCRIPT_STRING_ANALYSIS* pssa);
	HRESULT ScriptStringOut(SCRIPT_STRING_ANALYSIS ssa, INT iX, INT iY,
			UINT uOptions, RECT* prc, INT iMinSel, //starting pos for substringing output string
			INT iMaxSel, //ending pos for substringing output string
			BOOL fDisabled);
	HRESULT ScriptStringFree(SCRIPT_STRING_ANALYSIS* pssa);

	HRESULT ScriptItemize(LPCWSTR pwcInChars, int cInChars, //length of pwcChars
			int cMaxItems,
			SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, SCRIPT_ITEM* pItems, int* pcItems);
	HRESULT ScriptLayout(int cRuns, BYTE* pbLevel, int* piVisualToLogical, int* piLogicalToVisual);
	HRESULT ScriptPlace(HDC hdc, SCRIPT_CACHE* psc, WORD* pwGlyphs, int cGlyphs,
			SCRIPT_VISATTR* psva, SCRIPT_ANALYSIS* psa, int* piAdvance,
			GOFFSET* pGoffset, ABC* pABC);
	HRESULT ScriptShape(HDC hdc, // in
			SCRIPT_CACHE* psc, // in/out
			LPCWSTR pwcChars, //
			int cChars, //length of pwcChars; Number of characters in the Unicode run.
			int cMaxGlyphs, SCRIPT_ANALYSIS* psa, WORD* pwOutGlyphs,
			WORD* pwLogClust, SCRIPT_VISATTR* psva, int* pcGlyphs);
	HRESULT ScriptTextOut(HDC hdc, // const
			SCRIPT_CACHE* psc, int x, int y, UINT fuOptions,
			RECT* lprc, // const
			SCRIPT_ANALYSIS* psa, // const
			WCHAR* pwcReserved, // const
			int iReserved,
			WORD* pwGlyphs, //
			int cGlyphs, int* piAdvance, // const
			int* piJustify, // const
			GOFFSET* pGoffset // const
			);
	HRESULT ScriptXtoCP(int iX, UTF16shift cChars, //Count of logical code points in the run.
			int cGlyphs, WORD* pwLogClust, //
			SCRIPT_VISATTR* psva, //
			int* piAdvance, //
			SCRIPT_ANALYSIS* psa, //
			UTF16shift* piCP, UTF16shift* piTrailing);
	UINT SendInput(UINT nInputs, LPINPUT pInputs, int cbSize);
	// the basic
	//int SendMessageA(HWND hWnd, int msg, int wParam, int lParam );
	//int SendMessageW(HWND hWnd, int msg, int wParam, int lParam );
	//
	//int SendMessageA(HWND hWnd, UINT Msg, WPARAM wParam, void* lParam );
	//int SendMessageW(HWND hWnd, UINT Msg, WPARAM wParam, void* lParam );
	//int SendMessageA(HWND hWnd, UINT Msg, void* wParam, LPARAM lParam );
	//int SendMessageW(HWND hWnd, UINT Msg, void* wParam, LPARAM lParam );
	//int SendMessageA(HWND hWnd, UINT Msg, void* wParam, void* lParam );
	//int SendMessageW(HWND hWnd, UINT Msg, void* wParam, void* lParam );
	//
	//HWND SetCapture(
	//    HWND hWnd
	//);
	//BOOL SetCaretPos(
	//    int X,
	//    int Y
	//);
	//HANDLE SetClipboardData(
	//    UINT uFormat,
	//    HANDLE hMem
	//);
	//UINT SetDIBColorTable(
	//    HDC hdc,                // handle to device context whose DIB is of interest
	//    UINT uStartIndex,       // color table index of first entry to set
	//    UINT cEntries,          // number of color table entries to set
	//    RGBQUAD *pColors  // pointer to array of color table entries
	//);
	//UINT SetErrorMode(
	//    UINT uMode
	//);
	//BOOL SetEvent(
	//  HANDLE hEvent   // handle to event object
	//);
	//void SetLastError(
	//    DWORD dwErrCode
	//);
	DWORD SetLayout(HDC hdc, // handle to DC
			DWORD dwLayout // layout options
			);
	//BOOL SetMenu(
	//    HWND hWnd,
	//    HMENU hMenu
	//);
	//BOOL SetMenuDefaultItem(
	//    HMENU hMenu,
	//    UINT uItem,
	//    UINT fByPos
	//);
	BOOL SetMenuInfo(HMENU hmenu, LPCMENUINFO lpcmi);
	//BOOL SetMenuItemInfoA(
	//    HMENU hMenu,
	//    UINT uItem,
	//    BOOL fByPosition,
	//    LPMENUITEMINFOA lpmii
	//);
	//BOOL SetMenuItemInfoW(
	//    HMENU hMenu,
	//    UINT uItem,
	//    BOOL fByPosition,
	//    LPMENUITEMINFOW lpmii
	//);
	//UINT SetPaletteEntries(
	//    HPALETTE hpal,             // handle to logical palette
	//    UINT iStart,               // index of first entry to set
	//    UINT cEntries,             // number of entries to set
	//    PALETTEENTRY *lppe              // array of palette entries
	//);
	//HWND SetParent(
	//    HWND hWndChild,
	//    HWND hWndNewParent
	//);
	//// alias STDWIN.SetPixel SetPixel;
	//// alias STDWIN.SetROP2 SetROP2;
	//BOOL SetRect(
	//    LPRECT lprc, // rectangle
	//    int xLeft,   // left side
	//    int yTop,    // top side
	//    int xRight,  // right side
	//    int yBottom  // bottom side
	//);
	//// alias STDWIN.SetRectRgn SetRectRgn;
	//int SetScrollInfo(
	//    HWND hwnd,
	//    int fnBar,
	//    LPCSCROLLINFO lpsi,
	//    BOOL fRedraw
	//);
	//UINT_PTR SetTimer(
	//    HWND hWnd,
	//    UINT_PTR nIDEvent,
	//    UINT uElapse,
	//    TIMERPROC lpTimerFunc
	//);
	//LONG SetWindowLongA(
	//    HWND hWnd,
	//    int nIndex,
	//    LONG dwNewLong
	//);
	//LONG SetWindowLongW(
	//    HWND hWnd,
	//    int nIndex,
	//    LONG dwNewLong
	//);
	//
	//BOOL SetWindowPlacement(
	//    HWND hWnd,
	//    WINDOWPLACEMENT *lpwndpl
	//);
	//BOOL SetWindowPos(
	//    HWND hWnd,             // handle to window
	//    HWND hWndInsertAfter,  // placement-order handle
	//    int X,                 // horizontal position
	//    int Y,                 // vertical position
	//    int cx,                // width
	//    int cy,                // height
	//    UINT uFlags            // window-positioning flags
	//);
	//BOOL SetWindowTextA(
	//    HWND hWnd,
	//    LPCSTR lpString
	//);
	//BOOL SetWindowTextW(
	//    HWND hWnd,
	//    LPCWSTR lpString
	//);
	//HHOOK SetWindowsHookExA(
	//    int idHook,        // type of hook to install
	//    HOOKPROC lpfn,     // address of hook procedure
	//    HINSTANCE hMod,    // handle to application instance
	//    DWORD dwThreadId   // identity of thread to install hook for
	//);
	//HHOOK SetWindowsHookExW(
	//    int idHook,        // type of hook to install
	//    HOOKPROC lpfn,     // address of hook procedure
	//    HINSTANCE hMod,    // handle to application instance
	//    DWORD dwThreadId   // identity of thread to install hook for
	//);
	BOOL ShellExecuteExA(LPSHELLEXECUTEINFOA lpExecInfo);
	BOOL ShellExecuteExW(LPSHELLEXECUTEINFOW lpExecInfo);
	BOOL Shell_NotifyIconA(DWORD dwMessage, PNOTIFYICONDATAA lpdata);
	BOOL Shell_NotifyIconW(DWORD dwMessage, PNOTIFYICONDATAW lpdata);
	//BOOL ShowOwnedPopups(
	////    HWND hWnd,
	////    BOOL fShow
	//);
	version (WinCE) {
		BOOL SipGetInfo(SIPINFO* pSipInfo);
	}
	//DWORD SizeofResource(
	//    HMODULE hModule, // resource-module handle
	//    HRSRC hResInfo   // resource handle
	//);
	//void Sleep(
	//    DWORD dwMilliseconds
	//);
	//int StartDocA(
	//    HDC hdc,              // handle to DC
	//    DOCINFOA* lpdi          // contains file names
	//);
	//int StartDocW(
	//    HDC hdc,              // handle to DC
	//    DOCINFOW* lpdi          // contains file names
	//);
	//int StartPage(
	//    HDC hDC   // handle to DC
	//);
	// alias STDWIN.StretchBlt StretchBlt;
	//BOOL SystemParametersInfoA(
	//    UINT uiAction,
	//    UINT uiParam,
	//    PVOID pvParam,
	//    UINT fWinIni
	//);
	//BOOL SystemParametersInfoW(
	//    UINT uiAction,
	//    UINT uiParam,
	//    PVOID pvParam,
	//    UINT fWinIni
	//);
	//int ToAscii(
	//    UINT uVirtKey,
	//    UINT uScanCode,
	//    PBYTE lpKeyState,
	//    LPWORD lpChar,
	//    UINT uFlags
	//);
	//int ToUnicode(
	//    UINT wVirtKey,
	//    UINT wScanCode,
	//    PBYTE lpKeyState,
	//    LPWSTR pwszBuff,
	//    int cchBuff,
	//    UINT wFlags
	//);
	BOOL TrackMouseEvent(LPTRACKMOUSEEVENT lpEventTrack // pointer to a TRACKMOUSEEVENT structure
	);
	//int TranslateAcceleratorA(
	//    HWND hWnd,         // handle to destination window
	//    HACCEL hAccTable,  // handle to accelerator table
	//    LPMSG lpMsg        // address of structure with message
	//);
	//int TranslateAcceleratorW(
	//    HWND hWnd,         // handle to destination window
	//    HACCEL hAccTable,  // handle to accelerator table
	//    LPMSG lpMsg        // address of structure with message
	//);
	//UINT TranslateCharsetInfo(
	//    DWORD *lpSrc,
	//    LPCHARSETINFO lpCs,
	//    DWORD dwFlags
	//);
	//BOOL TranslateMDISysAccel(
	//    HWND hWndClient,
	//    LPMSG lpMsg
	//);
	//BOOL TranslateMessage(
	//    MSG *lpMsg   // address of structure with message
	//);
	version (WinCE) {
		BOOL TransparentImage(HDC hdcDest, LONG DstX, LONG DstY, LONG DstCx, LONG DstCy,
				HANDLE hSrc, LONG SrcX, LONG SrcY, LONG SrcCx, LONG SrcCy,
				COLORREF TransparentColor);
	}
	//BOOL UnhookWindowsHookEx(
	//    HHOOK hhk   // handle to hook procedure to remove
	//);
	//BOOL UnregisterClassA(
	//    LPCSTR lpClassName,  // address of class name string
	//    HINSTANCE hInstance   // handle of application instance
	//);
	//BOOL UnregisterClassW(
	//    LPCWSTR lpClassName,  // address of class name string
	//    HINSTANCE hInstance   // handle of application instance
	//);
	//SHORT VkKeyScanA(char ch);
	//SHORT VkKeyScanW(wchar ch);
	//BOOL WaitMessage();

	BOOL GetScrollBarInfo(HWND hwnd, LONG idObject, PSCROLLBARINFO psbi);

}

extern (C) {
	int wcslen(wchar* string);
}
