map('<Ctrl-f>', 'd');
map('<Ctrl-b>', 'e');

mapkey('oa', '#8Open Search with amazon.it', 'Front.openOmnibar({type: "SearchEngine", extra: "a"})');
mapkey('oh', '#8Open Search with github.com', 'Front.openOmnibar({type: "SearchEngine", extra: "h"})');
mapkey('oc', '#8Open Search with github.com', 'Front.openOmnibar({type: "SearchEngine", extra: "c"})');

addSearchAliasX('a', 'amazon.it', 'https://www.amazon.it/s/ref=nb_sb_noss/260-9728740-7288529?__mk_it_IT=ÅMÅŽÕÑ&url=search-alias%3Daps&field-keywords=');

addSearchAliasX('h', 'github', 'https://github.com/search?type=Repositories&utf8=%E2%9C%93&ref=simplesearch&q=');
addSearchAliasX('c', 'github-code', 'https://github.com/search?type=Code&utf8=%E2%9C%93&ref=simplesearch&q=');

// an example to create a new mapping `ctrl-y`
mapkey('<Ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});
