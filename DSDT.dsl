/*
 * Samsung Galaxy A71 (SM-A715F) / Qualcomm SM7150
 * Conservative Windows bring-up DSDT skeleton.
 *
 * This file is intentionally limited to namespace objects that are referenced
 * by the supplied IORT/DBG2 tables and the resources that can be established
 * directly from the supplied ACPI dump.
 *
 * IMPORTANT:
 *   - The placeholder devices are disabled with _STA = Zero.
 *   - Their HID is ACPI0004 only to keep the namespace objects well-formed
 *     while they remain disabled; replace these placeholders with exact
 *     A715F hardware descriptions before enabling them.
 *   - The IORT component originally named "\_SB.QSPI0" is not a valid AML
 *     namespace path because a NameSeg is four characters. The companion
 *     IORT has therefore been normalized to "\_SB.QSP0".
 */
DefinitionBlock ("", "DSDT", 2, "SAMSNG", "A715F   ", 0x00000002)
{
    Scope (\_SB)
    {
        Name (PLAT, "SM-A715F")
        Name (SOC,  "SM7150")

        /* Qualcomm debug UART namespace used by DBG2. */
        Device (UARD)
        {
            Name (_HID, "QCOM0236")
            Name (_UID, 0x0A)
            Name (_CCA, Zero)
            Method (_STA, 0, NotSerialized) { Return (0x0B) }
            Method (_CRS, 0, NotSerialized)
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite, 0x00A88000, 0x00001000)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,,)
                    {
                        0x00000182
                    }
                })
            }
        }

        /* USB root referenced by IORT. */
        Device (URS0)
        {
            Name (_HID, "QCOM0304")
            Name (_CID, "PNP0CA1")
            Name (_UID, Zero)
            Name (_CCA, Zero)
            Method (_STA, 0, NotSerialized) { Return (0x0B) }
            Method (_CRS, 0, NotSerialized)
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite, 0x0A600000, 0x000FFFFF)
                })
            }
        }

        /* USB device object required by IORT/DBG2: root-level, not under URS0. */
        Device (USB0)
        {
            Name (_ADR, Zero)
            Name (_S0W, 0x03)
            Method (_STA, 0, NotSerialized) { Return (0x0B) }
            Name (_UPC, Package (0x04) { One, 0x09, Zero, Zero })
        }

        /*
         * IORT named components. They remain non-enumerating until exact
         * A715F resources (MMIO, IRQ, GPIO, clocks, regulators, DMA/IOMMU
         * relationships) are taken from the exact device tree/firmware.
         */
        Device (GPU0)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x10)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
            Device (AVS0)
            {
                Name (_HID, "ACPI0004")
                Name (_UID, 0x11)
                Method (_STA, 0, NotSerialized) { Return (Zero) }
            }
        }

        Device (JPGE)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x12)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (ARPC)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x13)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (IPA)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x14)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (USBA)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x15)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (NPU0)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x16)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (QDSS)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x17)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (ADSP)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x18)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
            Device (ADCM)
            {
                Name (_HID, "ACPI0004")
                Name (_UID, 0x19)
                Method (_STA, 0, NotSerialized) { Return (Zero) }
            }
        }

        Device (QSP0)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x1A)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (QUP)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x1B)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (SDC2)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x1C)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (UFS0)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x1D)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
        }

        Device (AMSS)
        {
            Name (_HID, "ACPI0004")
            Name (_UID, 0x1E)
            Method (_STA, 0, NotSerialized) { Return (Zero) }
            Device (QWLN)
            {
                Name (_HID, "ACPI0004")
                Name (_UID, 0x1F)
                Method (_STA, 0, NotSerialized) { Return (Zero) }
            }
        }
    }
}
