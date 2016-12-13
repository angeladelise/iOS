//
//  AppDelegate.swift
//  MakeupDictionary1
//
//  Created by Angela Delise on 11/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

var selectedRow = 1;
var sectionNumber = 0;

var terms = [
             ["Fallout", "When eyeshadow falls from the eye onto the undereye or cheek area. Typically occurs with powdery shadows and glitters. This can be prevented with an eyeshadow shield.", "fallout.jpg",
              "NYX Face and Body Glitter - $6", "http://www.nyxcosmetics.com/face-and-body-glitter/NYX_308.html?cgid=glitter",
              "Wet n Wild Glitter Single", "https://www.walgreens.com/store/c/wet-n-wild-color-icon-glitter-single/ID=prod6206100-product",
              "Makeup Geek Sparklers - $10", "https://www.makeupgeek.com/makeup-geek-sparklers-light-year.html"],
             ["Flashback", "When flash photography creates a white cast on the face. This is due to the pigments of a foundation or powder that contain SPF.", "flashback.jpg",
              "Airspun Translucent Face Powder - $6", "https://www.walmart.com/ip/Coty-Airspun-Translucent-Extra-Coverage-Loose-Face-Powder/10312547",
              "E.l.f. HD Translucent Powder - $6", "http://www.elfcosmetics.com/p/high-definition-powder",
              "NYX Translucent Powder - $10", "http://www.ulta.com/studio-finishing-powder-translucent-finish?productId=xlsImpprod5050061"],
             ["Oxidation", "This occurs when a foundation color darkens after it is applied. Usually creating an orange and darker tint to the skin, when the liquid of the foundation react with the air.", "oxidation.jpg",
                "Covergirl Clean Foundation - $7", "http://www.ulta.com/clean-makeup-normal-skin?productId=xlsImpprod1860003",
                "NYC Smooth Skin - $5.29", "https://www.walmart.com/ip/NYC-New-York-Color-Smooth-Skin-Liquid-Makeup-Nude-1.0-fl-oz/24511455?wmlspartner=wlpa&selectedSellerId=1150&adid=22222222227022583251&wl0=&wl1=g&wl2=c&wl3=53412828392&wl4=pla-111821046032&wl5=9004385&wl6=&wl7=9004075&wl8=&wl9=pla&wl10=112549851&wl11=online&wl12=24511455&wl13=&veh=sem",
                "Maybelline Dream Matte Mousse - $8", "http://www.ulta.com/dream-matte-mousse-foundation?productId=VP00182"]
             ]

var techniques = [
             ["Baking", "A technique used to set the concealer of the undereye area by placing an excessive amount of translucent loose powder to the face. Place the powder onto the face for several minutes and then wipe it away with a powder brush.", "baking.jpg",
              "Airspun Translucent Face Powder - $6", "https://www.walmart.com/ip/Coty-Airspun-Translucent-Extra-Coverage-Loose-Face-Powder/10312547",
              "E.l.f. HD Translucent Powder - $6", "http://www.elfcosmetics.com/p/high-definition-powder",
              "NYX Translucent Powder - $10", "http://www.ulta.com/studio-finishing-powder-translucent-finish?productId=xlsImpprod5050061"],
             
             ["Color Correcting", "A technique used to hide imperfections of the face by using color theory. Colors opposite of one another on the color wheel counterbalance each other; therefore, to remove dark blue and purple under eye tones one can use a peach or orange toned concealer.", "colorcorrecting.jpg",
              "NYX Color Correcting Palette - $12", "http://www.ulta.com/color-correcting-concealer?productId=xlsImpprod12011171",
              "NYX Dark Circle Concealer - $6", "http://www.ulta.com/dark-circle-concealer?productId=xlsImpprod6380147",
              "Pixi Concealing Concentrate - $12", "http://www.target.com/p/pixi-by-petra-concealing-concentrate-0-07-oz-adaptable-beige/-/A-15440096?ref=tgt_adv_XS000000&AFID=google_pla_df&CPNG=PLA_Health+Beauty+Shopping&adgroup=SC_Health+Beauty&LID=700000001170770pgs&network=g&device=c&location=9060351&gclid=Cj0KEQiAsrnCBRCTs7nqwrm6pcYBEiQAcQSznDqf21ebNZc1h-Sf7INwABtMJ1r-C4sKI-xqBA8ImaMaAs628P8HAQ&gclsrc=aw.ds"],
             
             ["Contouring", "A technique used to add dimension to the face. Contouring creates shadows by placing a deeper shade, approximately 2-3 shades deeper than one's’ skin tone to the hollow of the cheeks, sides of the nose and the jaw area. Usually completed with highlighting. ", "contouring.jpg",
              "E.l.f. Contour Palette - $6", "http://www.target.com/p/e-l-f-contour-palette-83320-0-56-oz/-/A-49128587?ref=tgt_adv_XS000000&AFID=google_pla_df&CPNG=PLA_Health+Beauty+Shopping&adgroup=SC_Health+Beauty&LID=700000001170770pgs&network=g&device=c&location=9060351&gclid=Cj0KEQiAsrnCBRCTs7nqwrm6pcYBEiQAcQSznKfx2xWJQ0U16PMcBTxOr509nQqUP8gbHtIjuUqF2EMaAm0f8P8HAQ&gclsrc=aw.ds",
              "Maybelline Master Duo Stick - $12", "https://www.maybelline.com/face-makeup/contouring/facestudio-master-contour-v-shape-duo-stick",
              "Maybelline Contour Palette - $12", "https://www.maybelline.com/face-makeup/contouring/facestudio-master-contour"],
             
             ["Highlighting", "A technique used to emphasize particular areas of the face by bringing light to it. Highlighting is the act of placing a lighter shimmery shade to the high points of the face including the tops of the cheek bones, down the center of the nose and cupids bow. Usually completed with contouring.", "highlight.jpg",
              "E.l.f. Baked Highlighter - $4", "http://www.elfcosmetics.com/p/baked-highlighter",
              "Essence Pure Nude Highlighter - $4", "http://www.ulta.com/pure-nude-highlighter?productId=xlsImpprod14401021",
              "Makeup Revolution Baked Highlighter - $6", "http://www.ulta.com/vivid-baked-highlighters?productId=xlsImpprod12781073"],
             
             ["Overlining", "A technique used to emphasizes one’s lip shape. Over lining is completed by drawing outside of one’s lip line to create a bigger pout with a lip liner.", "overlining.jpg",
              "Rimmel Lip Liner - $4", "http://www.ulta.com/lasting-finish-1000-kisses-stay-on-lip-liner-pencil?productId=VP00117",
              "NYX Slim Lip Liner - $3.50", "http://www.ulta.com/slim-lip-pencil?productId=xlsImpprod2150078",
              "Revlon Lip Liner - $9", "http://www.ulta.com/colorstay-lip-liner?productId=xlsImpprod3520039"],
             
             ["Strobing", "A technique that is completed by only highlighting the face. As opposed to contouring, this technique only requires placing highlight to the face. This creates a light shimmery look to the skin. ", "strobing.jpg",
              "E.l.f. Baked Highlighter - $4", "http://www.elfcosmetics.com/p/baked-highlighter",
              "Essence Pure Nude Highlighter - $4", "http://www.ulta.com/pure-nude-highlighter?productId=xlsImpprod14401021",
              "Makeup Revolution Baked Highlighter - $6", "http://www.ulta.com/vivid-baked-highlighters?productId=xlsImpprod12781073"]
            ]

var products = [["Primer", "A primer is a cream or lotion applied before another cosmetic to improve coverage   and lengthen the amount of time the cosmetic lasts on the face. Can be in illuminating or mattifying forms and is typically placed all over the face.", "primer.jpg",
                 "Flower Beauty Sheer Tint - $13", "https://www.walmart.com/ip/Flower-E.E.-Erase-Everything-Ultimate-Foundation-UF1-Sheer-Tint-0.57-oz/49019701",
                 "L'Oreal Magic Lumi Primer - $13", "http://www.lorealparisusa.com/products/makeup/face/makeup-primer/magic-lumi-primer-magic-lumi-light-infusing-primer.aspx?shade=Magic-Lumi-Light-Infusing-Primer",
                 "Rimmel Stay Matte Primer - $7", "http://www.ulta.com/stay-matte-primer?productId=xlsImpprod6380065"],
                
                ["Foundation", "Foundation serves as the base of the face. Foundation is a skin coloured makeup applied to the face to create an even, uniform colour to the complexion, to cover flaws and, sometimes, to change the natural skintone. Can be in the form of a powder, liquid or cream.", "foundation.jpg",
                 "Revlon Color Stay Foundation - $13", "http://www.ulta.com/colorstay-makeup-normaldry-skin-spf-15?productId=xlsImpprod1810159",
                 "Maybelline Fit Me - $8", "https://www.maybelline.com/face-makeup/foundation/fit-me-matte-poreless-foundation",
                 "Rimmel Stay Matte Foundation - $5", "http://www.ulta.com/stay-matte-foundation?productId=xlsImpprod6380067"],
                
             ["Concealer", "A concealer or colour corrector is a type of cosmetic that is used to mask dark circles, age spots, large pores, and other small blemishes visible on the skin. It is similar to foundation, but thicker and used to hide different pigments by blending the imperfection into the surrounding skin tone.", "concealer.jpg",
              "NYX Concealer Jar - $5", "http://www.nyxcosmetics.com/concealer-jar/NYX_011.html",
              "Maybelline Fit Me Concealer - $6.50", "https://www.maybelline.com/face-makeup/concealer/fit-me-concealer",
              "Maybelline Age Rewind Concealer - $9", "http://www.ulta.com/instant-age-rewind-eraser-dark-circle-treatment-concealer?productId=xlsImpprod3490149"],
             
             ["Blush", "Blush or blusher is typically used to redden the cheeks so as to provide a more youthful appearance and to emphasize the cheekbones. Can have a shimmery or matte finish and can be in liquid, cream or powder form.", "blush.jpg",
              "E.l.f. Beautifully Bare Blush - $4", "http://www.ulta.com/beautifully-bare-blush?productId=xlsImpprod14521175",
              "NYX Baked Blush - $7", "http://www.ulta.com/baked-blush?productId=xlsImpprod6380149",
              "Maybelline Fit Me Blush - $6", "http://www.ulta.com/fit-me-blush?productId=xlsImpprod2980145"],
             
             ["Bronzer", "Bronzer is a powder, cream or liquid product used to give the skin a bronzed or tanned look. Usually applied to the perimeter of the face and is 1-2 shades darker than one's natural skin tone. ", "bronzer.jpg",
              "E.l.f. Mineral Bronzer - $5", "http://www.ulta.com/pressed-mineral-bronzer?productId=xlsImpprod14521187",
              "Maybelline Fit Me Bronzer - $6", "http://www.ulta.com/fit-me-bronzer?productId=xlsImpprod2980147",
              "Physicans Formula Butter Bronzer - $15", "http://www.ulta.com/butter-bronzer-murumuru-butter-bronzer?productId=xlsImpprod13621011"],
             
             ["Highlight", "Highlight is a powder, cream or liquid product used to emphasis certain areas of the face. Usually applied to the tops of the cheekbones, down the bridge of the nose and cupids bow and has a shimmery finish.", "highlight.jpg",
              "E.l.f. Baked Highlighter - $4", "http://www.elfcosmetics.com/p/baked-highlighter",
              "Essence Pure Nude Highlighter - $4", "http://www.ulta.com/pure-nude-highlighter?productId=xlsImpprod14401021",
              "Makeup Revolution Baked Highlighter - $6", "http://www.ulta.com/vivid-baked-highlighters?productId=xlsImpprod12781073"],
             
            ["Eyeshadow", "Eye shadow is a cosmetic that is applied on the eyelids. It is commonly used to make the wearer's eyes stand out or look more attractive. Eye shadow can add depth and dimension to one's eyes, complement the eye color, make one's eyes appear larger, or simply draw attention to the eyes.", "eyeshadow.jpg",
             "E.l.f. Mad for Matte Palette - $10", "http://www.target.com/p/e-l-f-eyeshadow-palette-mad-for-matte-0-49-oz/-/A-49128441",
             "Wet n Wild Color Icon Shadaows - $5", "http://www.wetnwildbeauty.com/eyes/shadow/color-icon-eyeshadow-collection.html",
             "NYX Nude Matte Shadow - $4.50", "http://www.nyxcosmetics.com/nude-matte-shadow/NYX_069.html"],
            
            ["Eyeliner", "Eyeliner is a cosmetic for the eyelids, usually applied in a thin line close to the lashes to accentuate the eyes. Can be applied to create a wing look to elongate the eyes.", "eyeliner.jpg",
             "E.l.f. Expert Liquid Liner - $2", "http://www.elfcosmetics.com/p/expert-liquid-liner",
             "Wet n Wild Liquid Liner - $3", "http://www.wetnwildbeauty.com/sale/megaliner-liquid-eyeliner.html",
             "NYX Matte Liquid Liner - $7", "http://www.nyxcosmetics.com/matte-liquid-liner/NYX_189.html"],
            
            ["Mascara", "Mascara is a tube of product typically sold in black and brown that is placed on the lashes to increase length and volume.", "mascara.jpg",
             "Jordana Best Lash Extreme - $4", "https://www.jordanacosmetics.com/Best-Lash-Extreme-Volumizing-Mascara.html",
             "Essence I Love Extreme Volume - $5", "http://www.ulta.com/i-love-extreme-crazy-volume-mascara?productId=xlsImpprod5050091",
             "Covergirl Lash Blash Volume - $6.29", "http://www.ulta.com/lashblast-volume-mascara?productId=xlsImpprod481642"],
            
            ["Lipstick", "Traditional lipstick is a creamy stick of product that is placed on one's lips to change their appearance. Can have a creamy, matte, shimmery or metallic finish and it is available in many shades from natural pinks and reds to yellows, blues and greens.", "lipstick.jpg",
             "Wet n Wild Megalast Lip Color - $2", "http://www.wetnwildbeauty.com/lips/lip-color/megalast-lip-color.html",
             "Rimmel Kate Moss Collection - $5.49", "http://www.ulta.com/lasting-finish-lipstick-kate-moss-collection?productId=xlsImpprod4090119",
             "Maybelline Color Sensational - $7.49", "http://www.ulta.com/color-sensational-lipcolor?productId=xlsImpprod2830011"],
            
            ["Lip Gloss", "Lip gloss is a product used primarily to give lips a glossy lustre, and sometimes to add a subtle color. Lip gloss can be in a squeezable tube or contain a wand applicator.", "lipgloss.jpg",
             "E.l.f. Extra Lip Gloss - $2", "http://www.elfcosmetics.com/p/ex-tra-lip-gloss",
             "Wet n Wild MegaSlicks - $2", "http://www.wetnwildbeauty.com/sale/megaslicks-lip-gloss.html",
             "Revlon Super Lustrous Lip Gloss - $6", "http://www.revlon.com/products/lips/lip-gloss/revlon-super-lustrous-lipgloss"],
            ["Liquid Lipstick", "Liquid lipstick is a modern cosmetic. It is a unique formulation that goes on like a liquid gloss but dries to a long-wearing, matte lipstick formulation. The formulas can range from mousse-y and liquidy to slightly tacky and very dry.", "liquidlipstick.jpg",
             "Revlon HD Matte Lip Color $9", "http://www.revlon.com/products/lips/lip-color/ultra-hd-matte-lipcolor",
             "Jordana Sweet Cream Matte Liquid Lip - $5", "https://www.jordanacosmetics.com/Sweet-Cream-Matte-Liquid-Lip-Color.html",
             "NYX Liquid Suede Cream Lipstick - $7", "http://www.nyxcosmetics.com/liquid-suede-cream-lipstick/NYX_201.html"],
           ]

var tools = [["Beauty Blender", "Modern Makeup sponge used to blend out face products including: foundation, concealer and cream blush and bronzers. The original beauty blender is $20; however, there are several drugstore versions of this product. ", "beautyblender.jpg",
              "Real Techniques Complexion Sponge - $6", "https://realtechniques.com/miracle-complexion-sponge/p/1426",
              "E.l.f. Blending Sponge - $5", "http://www.elfcosmetics.com/p/blending-sponge",
              "Morphe Flawless Beauty Sponge - $7", "https://www.morphebrushes.com/collections/morphe-beauty-sponges/products/morphe-flawless-beauty-sponge"],
             
             ["Eyelash Curler", "Device used to mechanically curl eyelashes. Place device near the lash line and press down 2-3 times for 8 second intervals.", "eyelashcurler.jpg",
              "E.l.f. Eyelash Curler - $2", "http://www.elfcosmetics.com/p/eyelash-curler",
              "Revlon Lash Curler - $6", "http://www.ulta.com/eyelash-curler?productId=prod1901084",
              "Maybelline Eyelash Curler - $5", "http://www.ulta.com/expert-tools-eyelash-curler?productId=xlsImpprod2850043"],
             
             ["Shadow Shield", "Device used to cover the under eye and cheek area when placing eyeshadow on the lids. It is used to prevent fallout from shadows and glitters from falling onto the facing. ", "shadowshield.jpg",
              "E.l.f. Mascara and Eyeshadow Shield - $3", "http://www.elfcosmetics.com/p/mascara-and-shadow-shield",
              "Shadow Shields - $10", "http://www.shadowshields.com/product/shadow-shields/",
              "Morphe Shadow Shields - $10", "https://www.morphebrushes.com/products/shadow-shields"]
             ]


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

