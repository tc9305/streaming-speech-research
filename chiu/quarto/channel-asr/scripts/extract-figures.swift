import Foundation
import PDFKit
import AppKit
let root=URL(fileURLWithPath:CommandLine.arguments[1])
let doc=PDFDocument(url: URL(fileURLWithPath:CommandLine.arguments[2]))!
// Crop rectangles in PDF points measured from the top-left of each page.
let crops:[(Int,String,CGRect)]=[
 (1,"fig1",CGRect(x:87,y:55,width:434,height:159)),
 (1,"fig2",CGRect(x:310,y:268,width:255,height:104)),
 (5,"fig3",CGRect(x:48,y:138,width:514,height:193))]
for (index,name,rect) in crops {
 let page=doc.page(at:index)!
 let renderScale: CGFloat = name == "fig2" ? 6 : 3
 let full=page.thumbnail(of:NSSize(width:612 * renderScale,height:792 * renderScale),for:.mediaBox)
 let bitmap=NSBitmapImageRep(data:full.tiffRepresentation!)!
 let scale=CGFloat(bitmap.pixelsWide)/612
 let crop=bitmap.cgImage!.cropping(to:CGRect(x:rect.minX*scale,y:rect.minY*scale,width:rect.width*scale,height:rect.height*scale))!
 let rep=NSBitmapImageRep(cgImage:crop)
 try! rep.representation(using:.png,properties:[:])!.write(to:root.appendingPathComponent(name+".png"))
 print("\(name): \(rep.pixelsWide) × \(rep.pixelsHigh)")
}
