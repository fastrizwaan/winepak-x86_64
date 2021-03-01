/*** Autogenerated by WIDL 6.0 from ../include/windows.foundation.idl - Do not edit ***/

#ifdef _WIN32
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif
#include <rpc.h>
#include <rpcndr.h>
#endif

#ifndef COM_NO_WINDOWS_H
#include <windows.h>
#include <ole2.h>
#endif

#ifndef __windows_foundation_h__
#define __windows_foundation_h__

/* Forward declarations */

#ifndef ____x_ABI_CWindows_CFoundation_CIStringable_FWD_DEFINED__
#define ____x_ABI_CWindows_CFoundation_CIStringable_FWD_DEFINED__
typedef interface __x_ABI_CWindows_CFoundation_CIStringable __x_ABI_CWindows_CFoundation_CIStringable;
#ifdef __cplusplus
namespace ABI {
    namespace Windows {
        namespace Foundation {
            interface IStringable;
        }
    }
}
#endif /* __cplusplus */
#endif

/* Headers for imported files */

#include <inspectable.h>
#include <windowscontracts.h>

#ifdef __cplusplus
extern "C" {
#endif

#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            enum PropertyType {
                PropertyType_Empty = 0,
                PropertyType_UInt8 = 1,
                PropertyType_Int16 = 2,
                PropertyType_UInt16 = 3,
                PropertyType_Int32 = 4,
                PropertyType_UInt32 = 5,
                PropertyType_Int64 = 6,
                PropertyType_UInt64 = 7,
                PropertyType_Single = 8,
                PropertyType_Double = 9,
                PropertyType_Char16 = 10,
                PropertyType_Boolean = 11,
                PropertyType_String = 12,
                PropertyType_Inspectable = 13,
                PropertyType_DateTime = 14,
                PropertyType_TimeSpan = 15,
                PropertyType_Guid = 16,
                PropertyType_Point = 17,
                PropertyType_Size = 18,
                PropertyType_Rect = 19,
                PropertyType_OtherType = 20,
                PropertyType_UInt8Array = 1025,
                PropertyType_Int16Array = 1026,
                PropertyType_UInt16Array = 1027,
                PropertyType_Int32Array = 1028,
                PropertyType_UInt32Array = 1029,
                PropertyType_Int64Array = 1030,
                PropertyType_UInt64Array = 1031,
                PropertyType_SingleArray = 1032,
                PropertyType_DoubleArray = 1033,
                PropertyType_Char16Array = 1034,
                PropertyType_BooleanArray = 1035,
                PropertyType_StringArray = 1036,
                PropertyType_InspectableArray = 1037,
                PropertyType_DateTimeArray = 1038,
                PropertyType_TimeSpanArray = 1039,
                PropertyType_GuidArray = 1040,
                PropertyType_PointArray = 1041,
                PropertyType_SizeArray = 1042,
                PropertyType_RectArray = 1043,
                PropertyType_OtherTypeArray = 1044
            };
        }
    }
}
extern "C" {
#else
enum __x_ABI_CWindows_CFoundation_CPropertyType {
    PropertyType_Empty = 0,
    PropertyType_UInt8 = 1,
    PropertyType_Int16 = 2,
    PropertyType_UInt16 = 3,
    PropertyType_Int32 = 4,
    PropertyType_UInt32 = 5,
    PropertyType_Int64 = 6,
    PropertyType_UInt64 = 7,
    PropertyType_Single = 8,
    PropertyType_Double = 9,
    PropertyType_Char16 = 10,
    PropertyType_Boolean = 11,
    PropertyType_String = 12,
    PropertyType_Inspectable = 13,
    PropertyType_DateTime = 14,
    PropertyType_TimeSpan = 15,
    PropertyType_Guid = 16,
    PropertyType_Point = 17,
    PropertyType_Size = 18,
    PropertyType_Rect = 19,
    PropertyType_OtherType = 20,
    PropertyType_UInt8Array = 1025,
    PropertyType_Int16Array = 1026,
    PropertyType_UInt16Array = 1027,
    PropertyType_Int32Array = 1028,
    PropertyType_UInt32Array = 1029,
    PropertyType_Int64Array = 1030,
    PropertyType_UInt64Array = 1031,
    PropertyType_SingleArray = 1032,
    PropertyType_DoubleArray = 1033,
    PropertyType_Char16Array = 1034,
    PropertyType_BooleanArray = 1035,
    PropertyType_StringArray = 1036,
    PropertyType_InspectableArray = 1037,
    PropertyType_DateTimeArray = 1038,
    PropertyType_TimeSpanArray = 1039,
    PropertyType_GuidArray = 1040,
    PropertyType_PointArray = 1041,
    PropertyType_SizeArray = 1042,
    PropertyType_RectArray = 1043,
    PropertyType_OtherTypeArray = 1044
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            struct Point {
                FLOAT X;
                FLOAT Y;
            };
        }
    }
}
extern "C" {
#else
struct __x_ABI_CWindows_CFoundation_CPoint {
    FLOAT X;
    FLOAT Y;
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            struct Size {
                FLOAT Width;
                FLOAT Height;
            };
        }
    }
}
extern "C" {
#else
struct __x_ABI_CWindows_CFoundation_CSize {
    FLOAT Width;
    FLOAT Height;
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            struct Rect {
                FLOAT X;
                FLOAT Y;
                FLOAT Width;
                FLOAT Height;
            };
        }
    }
}
extern "C" {
#else
struct __x_ABI_CWindows_CFoundation_CRect {
    FLOAT X;
    FLOAT Y;
    FLOAT Width;
    FLOAT Height;
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            struct DateTime {
                INT64 UniversalTime;
            };
        }
    }
}
extern "C" {
#else
struct __x_ABI_CWindows_CFoundation_CDateTime {
    INT64 UniversalTime;
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifdef __cplusplus
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            struct TimeSpan {
                INT64 Duration;
            };
        }
    }
}
extern "C" {
#else
struct __x_ABI_CWindows_CFoundation_CTimeSpan {
    INT64 Duration;
};
#endif

#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */
/*****************************************************************************
 * IStringable interface
 *
 * Introduced to Windows.Foundation.FoundationContract in version 1.0
 *
 */
#if WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000
#ifndef ____x_ABI_CWindows_CFoundation_CIStringable_INTERFACE_DEFINED__
#define ____x_ABI_CWindows_CFoundation_CIStringable_INTERFACE_DEFINED__

DEFINE_GUID(IID___x_ABI_CWindows_CFoundation_CIStringable, 0x96369f54, 0x8eb6, 0x48f0, 0xab,0xce, 0xc1,0xb2,0x11,0xe6,0x27,0xc3);
#if defined(__cplusplus) && !defined(CINTERFACE)
} /* extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            MIDL_INTERFACE("96369f54-8eb6-48f0-abce-c1b211e627c3")
            IStringable : public IInspectable
            {
                virtual HRESULT STDMETHODCALLTYPE ToString(
                    HSTRING *value) = 0;

            };
        }
    }
}
extern "C" {
#ifdef __CRT_UUID_DECL
__CRT_UUID_DECL(ABI::Windows::Foundation::IStringable, 0x96369f54, 0x8eb6, 0x48f0, 0xab,0xce, 0xc1,0xb2,0x11,0xe6,0x27,0xc3)
#endif
#else
typedef struct __x_ABI_CWindows_CFoundation_CIStringableVtbl {
    BEGIN_INTERFACE

    /*** IUnknown methods ***/
    HRESULT (STDMETHODCALLTYPE *QueryInterface)(
        __x_ABI_CWindows_CFoundation_CIStringable *This,
        REFIID riid,
        void **ppvObject);

    ULONG (STDMETHODCALLTYPE *AddRef)(
        __x_ABI_CWindows_CFoundation_CIStringable *This);

    ULONG (STDMETHODCALLTYPE *Release)(
        __x_ABI_CWindows_CFoundation_CIStringable *This);

    /*** IInspectable methods ***/
    HRESULT (STDMETHODCALLTYPE *GetIids)(
        __x_ABI_CWindows_CFoundation_CIStringable *This,
        ULONG *iidCount,
        IID **iids);

    HRESULT (STDMETHODCALLTYPE *GetRuntimeClassName)(
        __x_ABI_CWindows_CFoundation_CIStringable *This,
        HSTRING *className);

    HRESULT (STDMETHODCALLTYPE *GetTrustLevel)(
        __x_ABI_CWindows_CFoundation_CIStringable *This,
        TrustLevel *trustLevel);

    /*** IStringable methods ***/
    HRESULT (STDMETHODCALLTYPE *ToString)(
        __x_ABI_CWindows_CFoundation_CIStringable *This,
        HSTRING *value);

    END_INTERFACE
} __x_ABI_CWindows_CFoundation_CIStringableVtbl;

interface __x_ABI_CWindows_CFoundation_CIStringable {
    CONST_VTBL __x_ABI_CWindows_CFoundation_CIStringableVtbl* lpVtbl;
};

#ifdef COBJMACROS
#ifndef WIDL_C_INLINE_WRAPPERS
/*** IUnknown methods ***/
#define __x_ABI_CWindows_CFoundation_CIStringable_QueryInterface(This,riid,ppvObject) (This)->lpVtbl->QueryInterface(This,riid,ppvObject)
#define __x_ABI_CWindows_CFoundation_CIStringable_AddRef(This) (This)->lpVtbl->AddRef(This)
#define __x_ABI_CWindows_CFoundation_CIStringable_Release(This) (This)->lpVtbl->Release(This)
/*** IInspectable methods ***/
#define __x_ABI_CWindows_CFoundation_CIStringable_GetIids(This,iidCount,iids) (This)->lpVtbl->GetIids(This,iidCount,iids)
#define __x_ABI_CWindows_CFoundation_CIStringable_GetRuntimeClassName(This,className) (This)->lpVtbl->GetRuntimeClassName(This,className)
#define __x_ABI_CWindows_CFoundation_CIStringable_GetTrustLevel(This,trustLevel) (This)->lpVtbl->GetTrustLevel(This,trustLevel)
/*** IStringable methods ***/
#define __x_ABI_CWindows_CFoundation_CIStringable_ToString(This,value) (This)->lpVtbl->ToString(This,value)
#else
/*** IUnknown methods ***/
static FORCEINLINE HRESULT __x_ABI_CWindows_CFoundation_CIStringable_QueryInterface(__x_ABI_CWindows_CFoundation_CIStringable* This,REFIID riid,void **ppvObject) {
    return This->lpVtbl->QueryInterface(This,riid,ppvObject);
}
static FORCEINLINE ULONG __x_ABI_CWindows_CFoundation_CIStringable_AddRef(__x_ABI_CWindows_CFoundation_CIStringable* This) {
    return This->lpVtbl->AddRef(This);
}
static FORCEINLINE ULONG __x_ABI_CWindows_CFoundation_CIStringable_Release(__x_ABI_CWindows_CFoundation_CIStringable* This) {
    return This->lpVtbl->Release(This);
}
/*** IInspectable methods ***/
static FORCEINLINE HRESULT __x_ABI_CWindows_CFoundation_CIStringable_GetIids(__x_ABI_CWindows_CFoundation_CIStringable* This,ULONG *iidCount,IID **iids) {
    return This->lpVtbl->GetIids(This,iidCount,iids);
}
static FORCEINLINE HRESULT __x_ABI_CWindows_CFoundation_CIStringable_GetRuntimeClassName(__x_ABI_CWindows_CFoundation_CIStringable* This,HSTRING *className) {
    return This->lpVtbl->GetRuntimeClassName(This,className);
}
static FORCEINLINE HRESULT __x_ABI_CWindows_CFoundation_CIStringable_GetTrustLevel(__x_ABI_CWindows_CFoundation_CIStringable* This,TrustLevel *trustLevel) {
    return This->lpVtbl->GetTrustLevel(This,trustLevel);
}
/*** IStringable methods ***/
static FORCEINLINE HRESULT __x_ABI_CWindows_CFoundation_CIStringable_ToString(__x_ABI_CWindows_CFoundation_CIStringable* This,HSTRING *value) {
    return This->lpVtbl->ToString(This,value);
}
#endif
#endif

#endif

#endif  /* ____x_ABI_CWindows_CFoundation_CIStringable_INTERFACE_DEFINED__ */
#endif /* WINDOWS_FOUNDATION_FOUNDATIONCONTRACT_VERSION >= 0x10000 */

/* Begin additional prototypes for all interfaces */

ULONG           __RPC_USER HSTRING_UserSize     (ULONG *, ULONG, HSTRING *);
unsigned char * __RPC_USER HSTRING_UserMarshal  (ULONG *, unsigned char *, HSTRING *);
unsigned char * __RPC_USER HSTRING_UserUnmarshal(ULONG *, unsigned char *, HSTRING *);
void            __RPC_USER HSTRING_UserFree     (ULONG *, HSTRING *);

/* End additional prototypes */

#ifdef __cplusplus
}
#endif

#endif /* __windows_foundation_h__ */
