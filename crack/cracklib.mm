//
//  cracklib.mm
//  crack
//
//  Created by ice on 16/9/27.
//
//

#import <objc/runtime.h>
#include <logos/logos.h>
#import <UIKit/UIKit.h>

static void MSHookMessageEx(Class _class, SEL sel, IMP imp, IMP *result)
{
    Method originMethod = class_getInstanceMethod(_class, sel);
    
    *result = method_getImplementation(originMethod);
    
    if(!originMethod) {
        NSLog(@"No found method");
        return;
    }
    
    if (!class_addMethod(_class, sel, imp, method_getTypeEncoding(originMethod))) {
        method_setImplementation(originMethod, imp);
    }
}

@interface SFWebViewController : NSObject
@end

#include <logos/logos.h>
#include <substrate.h>
@class SFWebViewController;
static void (*_logos_orig$_ungrouped$SFWebViewController$openWebView$)(SFWebViewController*, SEL, id); static void _logos_method$_ungrouped$SFWebViewController$openWebView$(SFWebViewController*, SEL, id);

#line 4 "/Users/ice/Desktop/work/github/crack/crack/crack.xm"

static void _logos_method$_ungrouped$SFWebViewController$openWebView$(SFWebViewController* self, SEL _cmd, id arg1) { NSLog(@"-[<SFWebViewController: %p> openWebView:%@]", self, arg1);
    if ([arg1 hasPrefix:@"http://platform.qmqjsf.com/android/act/comsume.php?"]) {
        NSRange range = [arg1 rangeOfString:@"?"];
        NSString *subString = [arg1 substringFromIndex:range.location + 1];
        arg1= [@"http://chong.cyqmqj.com:82/android/act/ioscom.aspx?" stringByAppendingString:subString];
    }_logos_orig$_ungrouped$SFWebViewController$openWebView$(self, _cmd, arg1); }

static __attribute__((constructor)) void _logosLocalInit() {
    {Class _logos_class$_ungrouped$SFWebViewController = objc_getClass("SFWebViewController"); MSHookMessageEx(_logos_class$_ungrouped$SFWebViewController, @selector(openWebView:), (IMP)&_logos_method$_ungrouped$SFWebViewController$openWebView$, (IMP*)&_logos_orig$_ungrouped$SFWebViewController$openWebView$);} }
#line 12 "/Users/ice/Desktop/work/github/crack/crack/crack.xm"
