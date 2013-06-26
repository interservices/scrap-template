module namespace u = 'http://local.dev/util';

declare function u:json($items) {
    <json objects="value json">{$items}</json>
};

declare function u:contains($arg, $substring) {
	contains(upper-case($arg), upper-case($substring))
};

declare function u:form-urlencode($data) {
	let $pairs :=
        for $name in $data/*/*
        return concat(encode-for-uri(name($name)), '=', encode-for-uri(data($name)))
    return <out>{string-join($pairs, '&amp;')}</out>
};

declare function u:get($url , $params) {
    try {
        http:send-request(<http:request method='get' href="{$url}?{$params}"/>)[2]
    } catch err:XPTY0004 {
        'Typing error: ' || $err:description
    } catch * {
        'Error [' || $err:code || ']: ' || $err:description
    }
};

declare function u:get_simple($url) {
    try {
        http:send-request(<http:request method='get' href="{$url}"/>)[2]
    } catch err:XPTY0004 {
        'Typing error: ' || $err:description
    } catch * {
        'Error [' || $err:code || ']: ' || $err:description
    }
};

declare function u:parse($string) {
    try {
        html:parse($string, map { "nons" := "true"})
    } catch err:XPTY0004 {
        'Typing error: ' || $err:description
    } catch * {
        'Error [' || $err:code || ']: ' || $err:description
    }
};
