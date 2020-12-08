# BSrESignModule

## Informasi
BSrESignModule merupakan modul kripto berbasis bahasa pemrograman swift, yang didalamnya terdapat fungsi untuk :
1. Enrollment
    - Pembangkitan CSR
    - Bundling File P12

2. Digital Signature
    - Sign Dokumen secara lokal  (menggunakan file sertifikat .P12)
    - Sign Dokumen menggunakan API Service dari esign (menggunakan metode Sign Hash)
    - Verifikasi dokumen yang berisi tanda tangan digital secara lokal
    - Verifikasi dokumen yang berisi tanda tangan digital menggunakan API Service dari esign

## Spesifikasi Kebutuhan
1. iOS target pada versi 13.0
2. Swift 5

> PSPDFKit memliki permission yang perlu ditambahkan pada project, pastikan untuk menambah entry pada info.plist sesuai dengan [PSPDFKit Guides] (https://pspdfkit.com/guides/ios/current/getting-started/permissions/) 

## Instalasi

BSrESignModule menggunakan Github sebagai pod repository yang bersifat public.
untuk melakukan instalasi dapat melakukan langkah sebagai berikut :


```ruby
source 'https://github.com/hantek-bsre/BSrESignModule.git'
pod 'BSrESignModule', '~>1.0.1'
```

> Jika saat melakukan import library kedalam project (import BSrESignModule) terdapat error "Could not build Objective-C module 'BSrESignModule", pastikan untuk melakukan build project (command+b) terlebih dahulu.


## Penggunaan

### Contoh Properties

```
let inputPDFString = "file:///Users/61d/Desktop/AssetCryptoModule/DokumenUjiCoba.pdf"
let outputPDFString = "file:///Users/61d/Desktop/AssetCryptoModule/Output/DokumenUjiCobaHash_signed.pdf"
let inputPDFSignHash = "file:///Users/61d/Desktop/AssetCryptoModule/Output/DokumenUjiCoba_signed.pdf"
let outputPDFSignHash = "file:///Users/61d/Desktop/AssetCryptoModule/Output/DokumenUjiCobaMultiple_signed.pdf"
let image = "file:///Users/61d/Desktop/AssetCryptoModule/image.jpg"
let fileP12 = "file:///Users/61d/Desktop/AssetCryptoModule/sertifikat.p12"
let passphrase = "uhuyuhuy"
let validasiPDF = "file:///Users/61d/Desktop/AssetCryptoModule/Output/DokumenUjiCoba_signed.pdf"
let nik = 8898878
let passphraseAPI = "#uvuvwewvwevwe"
let pdfSignedURL = URL(string: outputPDFString)
let outputCSR = "file:///Users/61d/Desktop/AssetCryptoModule/Output/iOSCSRLib.pem"
let inputCSRSigned = "file:///Users/61d/Desktop/AssetCryptoModule/Output/UhuyLibSrE.pem"
let outputP12 = "file:///Users/61d/Desktop/AssetCryptoModule/Output/P12LibNew.p12"

```

### Generate CSR (Enrollment)

```swift
let enroll = Enrollments()

//1. MEMBANGKITKAN CSR
let derValue = enroll.CreateCSR(descriptions: "19923323334421_Proteksi Email dan Tanda Tangan Digital",
                           emailAddress: "sis@gmail.com",
                           commonName: "Sis",
                           organizationName: "Hore Corp",
                           organizationUnitName: "Uhuy Inc",
                           countryName:"ID",
                           stateOrProvinceName:"Jakarta",
                           localityName:"Pelalawan",
                           outputCSRurlString: outputCSR)
print ("nilai der value adalah : \(derValue)")


//2. BUNDLING FILE P12
enroll.CreateAndBundlingP12(inputCSRsignedURLString: inputCSRSigned, outputP12urlString: outputP12, setPassphrase: "y43L4h")
```

### Digital Signature

```swift
let sign = DigitalSignature()

//1. DIGITAL SIGNATURE DENGAN MENGGUNAKAN FILE P12 CLIENT (Not LTV Enabled & Timestamp not embedded)
 sign.digitalSignatureLocal(inputPDFurlString: inputPDFString,
 outputPDFurlString: outputPDFString,
 imageUrlString: image,
 fileP12urlString: fileP12,
 passphrase: passphrase,
 x: 210, y: 320, width: 150, height: 50,
 pageSignature: 1,
 signerName: "uvuvwevwevwe")
 //halaman pertama pada pageSignature dimulai dengan nilai 0

//2. DIGITAL SIGNATURE DENGAN MENGGUNAKAN ESIGN API SERVICE (SIGN HASH)
 sign.signHashAPI(nik: nik,
 passphrase: passphraseAPI,
 inputPDFurlString: inputPDFString,
 outputPDFurlString: outputPDFString,
 imageUrlString: image, x: 210, y: 320, width: 150, height: 50,
 pageSignature: 0,
 signerName: "uvuvwevwevwe")
 //halaman pertama pada pageSignature dimulai dengan nilai 0


//3. VERIFIKASI DOKUMEN YANG BERISI TANDA TANGAN DIGITAL SECARA LOKAL (Limited Get Information)
var nilaiValidasi:PDFSignatureStatus?
nilaiValidasi = sign.validationDocument(inputPDFurlString: validasiPDF)
print("nilai validasi dokumen = \(String(describing: nilaiValidasi!))")


//4. VERIFIKASI DOKUMEN YANG BERISI TANDA TANGAN DIGITAL MENGGUNAKAN SERVICE ESIGN
let api = EsignAPI()
api.getAccessToken(){ (hasilToken) in
api.verifyDocument(aksesToken: hasilToken, urlPDF: pdfSignedURL!){ (returnVerify) in
print("Hasil Verifikasi dokumen : \(returnVerify)")
}
}
=======
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BSrESignModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BSrESignModule'
>>>>>>> Initial commit
```

## Author

<<<<<<< HEAD
siswasandi@gmail.com, hantek.bsre@gmail.com

## Lisensi
=======
siswasandi@gmail.com, siswandi.agung@bssn.go.id

## License
>>>>>>> Initial commit

BSrESignModule is available under the MIT license. See the LICENSE file for more info.
