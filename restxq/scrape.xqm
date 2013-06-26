module namespace p = 'http://basex.org/modules/web-page';

declare namespace u = 'http://local.dev/util';
declare namespace xhtml = 'http://www.w3.org/1999/xhtml';

import module 'http://local.dev/util' at 'util.xqm';

declare %restxq:path('scrape')
        %restxq:GET
        %restxq:query-param("url", "{$url}", "http://www.amazon.com/dp/1449319432/")
        %output:method('html')
        %output:version('5.0')
function p:scrape($url) {
    u:get_simple($url)//xhtml:div[@id='ps-content']
};