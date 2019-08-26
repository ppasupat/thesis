var YELLOW = '#F7F9D0';

var hikingEx = {
  x: 'hiking trails near Baltimore',
  x2col: function() { return ytable(nl('hiking trails'), nl('near Baltimore')).center(); },
  z: '/html/body/table[2]/tr/td[1]',
  y: '[Avalon Super Loop, Hilton Area, ...]',
};

G.extractionDataset = function() {
  function q(x) { return nl(x); }
  function webpage(query, page) {
    return ytable(
      page,
      nl(query),
    _).center();
  }
  return xtable(
    ytable(
      bold('Queries'),
      ytable(
        q('airlines of italy'),
        q('natural causes of global warming'),
        q('lsu football coaches'),
        q('bf3 submachine guns'),
        q('badminton tournaments'),
        q('foods high in dha'),
        q('technical colleges in south carolina'),
        q('songs on glee season 5'),
        q('singers who use auto tune'),
        //q('people who signed the articles of confederation'),
        q('san francisco radio stations'),
        q('actors from boston'),
      _),
    _),
    ytable(
      bold('Examples (web page, query)'),
      xtable(
        webpage('airlines of italy',
                // http://www.ranker.com/list/all-italian-airlines/list-of-airlines
                frameBox(image('images/airlines.png').width(W = 300))),
        webpage('natural causes of global warming',
                // http://listdose.com/top-10-main-causes-of-global-warming/
                frameBox(image('images/warming.png').width(W))),
        webpage('lsu football coaches',
                // http://www.lsusports.net/SportSelect.dbml?SPSID=28715&SPID=2164
                frameBox(image('images/football-blur.png').width(W))),
      _).margin(10),
    _).margin(10),
  _).margin(50, 0);
}

G.extractionExample = function() {
  var T = rootedTree, s = 1;
  function f(x) { return frame(text('$\\T{' + x + '}$').scale(s)).padding(2); }
  function fsel(x) { return frame(text(redbold('$\\T{' + x + '}$')).scale(s)).padding(2); }
  function ftext(x) {
    if (!x) x = '(text)';
    x = x.substring(0, 4) + '..';
    return text(x).scale(s);
  }
  var tree = T(
    f('html'),
    f('head'),
    T(f('body'),
      T(f('table'), T(f('tr'),
        T(f('td'), ftext('Home')),
        T(f('td'), ftext('Explore')),
        T(f('td'), ftext('Mobile Apps')),
        T(f('td'), ftext('Create Trip')),
      _)),
      T(f('h1'), ftext('Hiking near Baltimore, Maryland')),
      T(f('table'),
        T(f('tr'), T(f('th'), ftext('Name')), T(f('th'), ftext('Length'))),
        T(f('tr'), T(fsel('td'), ftext('Avalon...')), T(f('td'), ftext('12.7 miles'))),
        f('...'),
        T(f('tr'), T(fsel('td'), ftext('Governer...')), T(f('td'), ftext('3.1 miles'))),
      _),
    _).xmargin(0),
  _).xmargin(0);

  tree.recnodeBorderWidth(0).recnodePadding(0);

  function button(x) { return frameBox(x).padding(5).bg.round(10).end; }
  var webpage = frameBox(
    ytable(
      xtable(
        button('Home'),
        button('Explore'),
        button('Mobile Apps'),
        button('Create Trip'),
      _).margin(5),
      bold('Hiking near Baltimore, Maryland'),
      table(
        ['Name', 'Length'].map(bold),
        [red('Avalon Super Loop'), '12.7 miles'],
        [red('Hilton Area'), '7.8 miles'],
        [red('Avalon Loop'), '9.4 miles'],
        [red('Wildlands Loop'), '4.4 miles'],
        [red('Mckeldin Area'), '16.7 miles'],
        [red('Greenbury Point'), '3.7 miles'],
        [red('Governer Bridge Natural Area'), '3.1 miles'],
      _).margin(30, 0),
    _).margin(5).center(),
  'white').bg.strokeWidth(4).end.padding(10);

  var treeQuery = ytable(
    bold('DOM tree $w$'),
    tree,
    xtable(bold('Extraction path $z =$'), redbold('$\\T{' + hikingEx.z + '}$')).margin(10),
  _).margin(20);

  return xtable(
    treeQuery,
    ytable(bold('Rendered web page'), webpage).margin(10),
  _).margin(20);
}

G.extractionFeatureRecipe = function () {
  function o(x) {return overlay(circle(20).fillColor('#DDF'), std(x).orphan(true)).center();}
  function p(x) {return overlay(rect(40, 40).fillColor('#FFD'), std(x).orphan(true)).center();}
  var originalList = frameBox(xtable(o('A'), o('B'), o('C'), o('D'), o('E')).margin(20)).padding(10);
  var abstractList = frameBox(xtable(p(1), p(2), p(0), p(1), p(0)).margin(20)).padding(10);
  var len = 50;
  var histogram = frameBox(ytable(
    overlay(
      line([0,0], [130,0]),
      line([0,0], [0,100]),
      transform(rect(30, 90).fillColor('#AAA')).pivot(-1, 1).shift(20, 0),
      transform('0').pivot(0, -1).shift(35, 0),
      transform(rect(30, 90).fillColor('#AAA')).pivot(-1, 1).shift(50, 0),
      transform('1').pivot(0, -1).shift(65, 0),
      transform(rect(30, 45).fillColor('#AAA')).pivot(-1, 1).shift(80, 0),
      transform('2').pivot(0, -1).shift(95, 0),
    _),
    "histogram",
  _).center()).padding(10);
  function feature(x) {return frame(text("$\\textsc{" + x + "}$")).padding(10, 0);}
  var arrow1, arrow2, a = [], b = [];
  return overlay(
    ytable(
      originalList,
      arrow1 = bigDownArrow(len),
      abstractList,
      arrow2 = bigDownArrow(len),
      histogram,
    _).margin(10).center(),
    moveRightOf(("abstraction"), arrow1, 15),
    moveRightOf(("aggregation"), arrow2, 15),
    moveRightOf(table(
      [b[1] = nil(), a[1] = feature("Entropy")],
      [b[2] = nil(), a[2] = feature("Majority")],
      [b[3] = nil(), a[3] = feature("MajorityRatio")],
      [b[4] = nil(), a[4] = feature("Single")],
      [b[5] = nil(), a[5] = feature("(Mean)")],
      [b[6] = nil(), a[6] = feature("(SD)")],
    _).justify('l', 'c'), histogram, 160),
    arrow(histogram, b[1]),
    arrow(histogram, b[2]),
    arrow(histogram, b[3]),
    arrow(histogram, b[4]),
    arrow(histogram, b[5]),
    arrow(histogram, b[6]),
  _);
};

G.extractionFeatureStructural = function () {
  var s = 1;
  function T() { var t = rootedTree.apply(null, arguments); t.margin(10, 35); return t; }
  function f(x) { return frame(text('$\\T{' + x + '}$').scale(s)).padding(2); }
  function fsel(x) { return frame(text(redbold('$\\T{' + x + '}$')).scale(s)).padding(2); }
  var tree = T(
    f('html'),
    f('head'),
    T(f('body'),
      T(f('table'), T(f('...'))),
      T(f('h1')),
      T(f('table'),
        T(f('tr'), T(f('th')), T(f('th'))),
        T(f('tr'), T(fsel('td')), T(f('td'))),
        T(f('tr'), T(fsel('td')), T(f('td'))),
        f('...'),
        T(f('tr'), T(fsel('td')), T(f('td'))),
      _),
    _),
  _);
  tree.recnodeBorderWidth(0).recnodePadding(0);
  return tree;
};

G.extractionFeatureDenotation = function () {
  return frameBox(ytable(
    bold('Selected entities'),
    nl('Avalon Super Loop'),
    nl('Hilton Area'),
    nl('Avalon Loop'),
    nl('Wildlands Loop'),
    nl('Mckeldin Area'),
    nl('Greenbury Point'),
    nl('Governer Bridge Natural Area'),
  _).margin(30, 0).center()).padding(10);
};
