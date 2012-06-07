using System;
using System.Runtime.InteropServices;

namespace CVLK2011.Models
{
    public static class Harddisk
    {
        private const int CREATE_NEW = 1;
        private const int DFP_RECEIVE_DRIVE_DATA = 0x7c088;
        public static string[] DriveStrings = new string[] { "Fixed", "Removable", "Unknown" };
        private const int FILE_SHARE_READ = 1;
        private const int FILE_SHARE_WRITE = 2;
        private const uint GENERIC_READ = 0x80000000;
        private const uint GENERIC_WRITE = 0x40000000;
        private const int INVALID_HANDLE_VALUE = -1;
        private const int OPEN_EXISTING = 3;
        private const int VER_PLATFORM_WIN32_NT = 2;

        [DllImport("kernel32.dll")]
        private static extern int CloseHandle(int hObject);
        [DllImport("kernel32.dll")]
        private static extern int CreateFile(string lpFileName, uint dwDesiredAccess, int dwShareMode, int lpSecurityAttributes, int dwCreationDisposition, int dwFlagsAndAttributes, int hTemplateFile);
        [DllImport("kernel32.dll")]
        private static extern int DeviceIoControl(int hDevice, int dwIoControlCode, [In, Out] SENDCMDINPARAMS lpInBuffer, int lpInBufferSize, [In, Out] SENDCMDOUTPARAMS lpOutBuffer, int lpOutBufferSize, ref int lpBytesReturned, int lpOverlapped);
        public static string FindHardDiskSerialNumber()
        {
            int num;
            string str = " ";
            string str2 = " ";
            string str3 = " ";
            int lpBytesReturned = 0;
            int num3 = 0;
            SENDCMDINPARAMS lpInBuffer = new SENDCMDINPARAMS();
            SENDCMDOUTPARAMS structure = new SENDCMDOUTPARAMS();
            if (Environment.OSVersion.Platform == PlatformID.Win32NT)
            {
                num = CreateFile(@"\\.\PhysicalDrive0", 0xc0000000, 3, 0, 3, 0, 0);
            }
            else
            {
                num = CreateFile(@"\\.\Smartvsd", 0, 0, 0, 1, 0, 0);
            }
            if (num != -1)
            {
                lpInBuffer.DriveNumber = (byte) num3;
                lpInBuffer.BufferSize = Marshal.SizeOf(structure);
                lpInBuffer.DriveRegs.DriveHead = (byte) (160 | (num3 << 4));
                lpInBuffer.DriveRegs.Command = 0xec;
                lpInBuffer.DriveRegs.SectorCount = 1;
                lpInBuffer.DriveRegs.SectorNumber = 1;
                if (DeviceIoControl(num, 0x7c088, lpInBuffer, Marshal.SizeOf(lpInBuffer), structure, Marshal.SizeOf(structure), ref lpBytesReturned, 0) != 0)
                {
                    str = SwapChars(structure.IDS.SerialNumber);
                    str2 = SwapChars(structure.IDS.ModelNumber);
                    str3 = SwapChars(structure.IDS.FirmwareRevision);
                }
                str = str.Trim();
                while ((str.Length % 4) != 0)
                {
                    str = str + "+";
                }
            }
            return str;
        }

        private static string SwapChars(char[] chars)
        {
            for (int i = 0; i <= (chars.Length - 2); i += 2)
            {
                char ch = chars[i];
                chars[i] = chars[i + 1];
                chars[i + 1] = ch;
            }
            return new string(chars);
        }

        [StructLayout(LayoutKind.Sequential, Size=12)]
        private class DRIVERSTATUS
        {
            public byte DriveError;
            public byte IDEStatus;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=2)]
            public byte[] Reserved = new byte[2];
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=2)]
            public int[] Reserved2 = new int[2];
        }

        public enum DriveTypes
        {
            Fixed,
            Removable,
            Unknown
        }

        [StructLayout(LayoutKind.Sequential, Size=8)]
        private class IDEREGS
        {
            public byte Features;
            public byte SectorCount;
            public byte SectorNumber;
            public byte CylinderLow;
            public byte CylinderHigh;
            public byte DriveHead;
            public byte Command;
            public byte Reserved;
        }

        [StructLayout(LayoutKind.Sequential)]
        private class IDSECTOR
        {
            public short GenConfig;
            public short NumberCylinders;
            public short Reserved;
            public short NumberHeads;
            public short BytesPerTrack;
            public short BytesPerSector;
            public short SectorsPerTrack;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
            public short[] VendorUnique = new short[3];
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=20)]
            public char[] SerialNumber = new char[20];
            public short BufferClass;
            public short BufferSize;
            public short ECCSize;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=8)]
            public char[] FirmwareRevision = new char[8];
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=40)]
            public char[] ModelNumber = new char[40];
            public short MoreVendorUnique;
            public short DoubleWordIO;
            public short Capabilities;
            public short Reserved1;
            public short PIOTiming;
            public short DMATiming;
            public short BS;
            public short NumberCurrentCyls;
            public short NumberCurrentHeads;
            public short NumberCurrentSectorsPerTrack;
            public int CurrentSectorCapacity;
            public short MultipleSectorCapacity;
            public short MultipleSectorStuff;
            public int TotalAddressableSectors;
            public short SingleWordDMA;
            public short MultiWordDMA;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=0x17e)]
            public byte[] Reserved2 = new byte[0x17e];
        }

        [StructLayout(LayoutKind.Sequential, Size=0x20)]
        private class SENDCMDINPARAMS
        {
            public int BufferSize;
            public Harddisk.IDEREGS DriveRegs = new Harddisk.IDEREGS();
            public byte DriveNumber;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
            public byte[] Reserved = new byte[3];
            [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
            public int[] Reserved2 = new int[4];
        }

        [StructLayout(LayoutKind.Sequential)]
        private class SENDCMDOUTPARAMS
        {
            public int BufferSize;
            public Harddisk.DRIVERSTATUS Status = new Harddisk.DRIVERSTATUS();
            public Harddisk.IDSECTOR IDS = new Harddisk.IDSECTOR();
        }
    }
}

