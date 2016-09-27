@interface SFWebViewController : NSObject
@end

%hook SFWebViewController
- (void)openWebView:(id)arg1 { %log;
    if ([arg1 hasPrefix:@"http://platform.qmqjsf.com/android/act/comsume.php?"]) {
        NSRange range = [arg1 rangeOfString:@"?"];
        NSString *subString = [arg1 substringFromIndex:range.location + 1];
        arg1= [@"http://chong.cyqmqj.com:82/android/act/ioscom.aspx?" stringByAppendingString:subString];
    }%orig; }
%end