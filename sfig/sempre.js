// Overall framework
G.framework = function() {
  var t = node($c('w'), true), w = node($c('w'), true), x = node($c('x'), true),
      Zx = node($c('Zx')), z = node($c('z')), y = node($c('y'), true),
      c = '#ffffcc',
      bConversion = frameBox('(1) Representation', c).padding(10,3),
      bParsing = frameBox('(2) Parsing', c).padding(10,3),
      bRanking = frameBox('(3) Ranking', c).padding(10,3),
      bExecution = frameBox('(4) Execution', c).padding(10,3);
  
  function rr(w, h) {
    var x = ytable.apply(null, Array.prototype.slice.call(arguments, 2)).center();
    return overlay(rect(w, h), x.scale(.2)).center();
  }
  var tabru = table(
    [rr(20, 10, bold('xxx')), rr(25, 10, bold('xxxx')),
     rr(20, 10, bold('xxxxx')), rr(20, 10, bold('xxxx')), rr(20, 10, bold('xxxx'))],
    [
     rr(20, 45, 'xxxx', 'xxxx', 'xxxx', 'xxxx', 'xxxx'),
     rr(25, 45, 'xxxxxx', 'xxxxx', 'xxxxxx', 'xxxxxx', 'xxxxxxx'),
     rr(20, 45, 'xxx', 'xx', 'xxxx', 'xx', 'xxx'),
     rr(20, 45, 'xx', 'xx', 'xxx', 'xx', 'xx'),
     rr(20, 45, 'xx', 'xx', 'xx', 'xxx', 'xxx'),
    ],
    _).strokeColor(G.tlcolor);

  function miniGraph() {
    var s = 20;
    var anchor = [],
      r1 = circle(s/2), r2 = circle(s/2),
      id1 = square(s), id2 = square(s),
      node1 = rect(s*2, s), node2 = rect(s*2, s), node3 = rect(s*2, s), node4 = rect(s*2, s);
    return overlay(
      table(
        [nil(), r1, anchor[11] = nil(), nil(), anchor[12] = nil(), nil(), anchor[13] = text('\\;...')],
        [id1, nil(), nil(), node1, nil(), node3, nil()],
        [nil(), r2, anchor[21] = nil(), nil(), anchor[22] = nil(), nil(), anchor[23] = text('\\;...')],
        [id2, nil(), nil(), node2, nil(), node4, nil()],
        [nil(), anchor[30] = text('...'), nil(), nil(), nil(), nil(), nil()],
      ).margin(5).center(),
      arrow(r1, r2), arrow(r2, anchor[30]),
      arrow(r1, id1), arrow(r2, id2),
      arrow(r1, anchor[13]), arrow(r2, anchor[23]),
      arrow(anchor[11], node1), arrow(anchor[21], node2),
      arrow(anchor[12], node3), arrow(anchor[22], node4),
    _).scale(.5).strokeColor(G.wlcolor);
  }
  var graph = miniGraph();
  
  var question = ytable(greenitalic('Where did the last'), greenitalic('1st place finish occur?')).center();
  var formula = text(red('$\\T{VenueOf}.\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda r[\\T{IndexOf}.r])$'));
  
  return overlay(
    table(
      [nil(), nil(), t, nil()],
      [nil(), nil(), bConversion, nil()],
      [x, bParsing, w, nil()],
      [nil(), Zx, nil(), nil()],
      [nil(), bRanking, nil(), nil()],
      [nil(), z, bExecution, y],
      _).center().margin(40,30),
    arrow(t, bConversion), arrow(bConversion, w),
    arrow(x, bParsing), arrow(w, bParsing), arrow(bParsing, Zx),
    arrow(x.items[0], bRanking),
    arrow(w.items[0], bRanking),
    arrow(Zx, bRanking), arrow(bRanking, z),
    arrow(z, bExecution), arrow(w, bExecution), arrow(bExecution, y),
    moveRightOf(tabru, t, 20),
    moveRightOf(graph, w, 20),
    //moveRightOf(knowledgeGraph().scale(0.2), w, 20),
    moveTopOf(question.scale(0.8), x, 15),
    moveBottomOf(formula.scale(0.8), z, 10),
    moveBottomOf(text(purple('$\\{\\T{Thailand}\\}$')).scale(0.9), y, 10),
    _);
}

// Knowledge Graph of the Olympics table
G.knowledgeGraph = function() {
  // Node
  function n(x, strokeColor) {
    var myNode = x ? frameBox(x).padding(10,3) : circle(20);
    if (strokeColor) {
      myNode.strokeColor(strokeColor);
      if (myNode.bg) myNode.bg.strokeColor(strokeColor);
    }
    return myNode;
  }
  
  var row1 = n(''), row2 = n(''),
      id1 = n(italics('0'), 'blue'), id2 = n(italics('1'), 'blue'),
      year1 = n("$\\T{1896}$"), city1 = n("$\\T{Athens}$"), country1 = n("$\\T{Greece}$"),
      year2 = n("$\\T{1900}$"), city2 = n("$\\T{Paris}$"), country2 = n("$\\T{France}$"),
      prop1 = n(italics('1900.0'), 'red'), prop2 = n(italics('1900-XX-XX'), 'red'),
      anchor1 = frame('$\\cdots$').padding(10),
      anchor2 = frame('$\\cdots$').padding(10),
      anchor0 = text('$\\vdots$'),
      b11 = nil(), b12 = nil(), b13 = nil(), b21 = nil(), b22 = nil(), b23 = nil();
  prop1.strokeColor('red');
  prop2.strokeColor('red');
  id1.strokeColor('blue');
  id2.strokeColor('blue');
  function curveArrow(s, t) {
    return arrow([s.left().sub(30), s.ymiddle()], t);
      //.line.curve(true).ctrlp1(s.xmiddle(), s.ymiddle()).ctrlp2(s.xmiddle(), s.ymiddle()).end;
  }
  function lbl(a, t, px, py, dx, dy, strokeColor) {
    dx = +dx; dy = +dy;
    t = "$\\T{" + t + "}$";
    if (strokeColor) {
      a.strokeColor(strokeColor);
      t = text(t).strokeColor(strokeColor);
    }
    return [a, transform(t).pivot(px || 0, py || 0).shift( 
      dx ? a.xmiddle()[dx > 0 ? 'add' : 'sub'](dx > 0 ? dx : -dx) : a.xmiddle(),
      dy ? a.ymiddle()[dy > 0 ? 'down' : 'up'](dy > 0 ? dy : -dy) : a.ymiddle())];
  }
  var arrows = [].concat(
    lbl(arrow(row1, row2), 'Next', -1, 0, 8, -15, 'blue'),
    lbl(arrow(row2, anchor0), 'Next', -1, 0, 8, -15, 'blue'),
    lbl(arrow(row1, id1), 'Index', 1, 1, 0, 0, 'blue'),
    lbl(arrow(row2, id2), 'Index', 1, 1, 0, 0, 'blue'),
    line(row1, anchor1),
    line(row2, anchor2),
    lbl(curveArrow(b11, year1), 'Year', -1, 0, 10),
    lbl(curveArrow(b12, city1), 'City', -1, 0, 10),
    lbl(curveArrow(b13, country1), 'Country', -1, 0, 10),
    lbl(curveArrow(b21, year2), 'Year', -1, 0, 10),
    lbl(curveArrow(b22, city2), 'City', -1, 0, 10),
    lbl(curveArrow(b23, country2), 'Country', -1, 0, 10),
    lbl(arrow(year2, prop1), 'Number', 1, 0, -5, 0, 'red'),
    lbl(arrow(year2, prop2), 'Date', -1, 0, 20, 0, 'red'),
    _);
  return overlay(
    table(
      [nil(), row1, b11, b12, b13, anchor1],
      [id1, nil(), year1, city1, country1, nil()],
      [nil(), row2, b21, b22, b23, anchor2],
      [id2, nil(), year2, city2, country2, nil()],
      [nil(), anchor0, nil(), nil(), nil(), nil()],
      _).center().margin(55, 18),
    transform(xtable(prop1, prop2).center().margin(30))
      .pivot(-1, -1).shift(year2.left().sub(20), year2.bottom().down(60)),
    overlay.apply(null, arrows),
    _);
}


G.beamsizePlot = function() {
  var beams = [1, 5, 10, 15, 25, 50, 100, 200, 400];
  var acc = [6.0, 30.3, 34.1, 37.0, 36.3, 36.1, 35.8, 37.1, 36.5];
  var ora = [8.7, 56.2, 68.2, 70.8, 73.8, 75.8, 77.0, 77.6, 78.0];
  var times = [20, 1*60+24, 2*60+52, 3*60+55, 5*60+54, 8*60+58, 12*60+55, 16*60+48, 22*60+53];
   
  var graph = lineGraph(
    ora.map(function (x, i) {return [Math.log(beams[i]), x];}),
    acc.map(function (x, i) {return [Math.log(beams[i]), x];})
    )
    .trajectoryNames(['oracle', 'accuracy'])
    .trajectoryColors(['blue', 'red', 'green'])
    .axisLabel('beam size', 'score')
    .xexpValue(true)
    .yrange(0, 80).ytickStartValue(0).ytickIncrValue(10)
    .length(200, 150)
    .axisLabelPadding(20);
  return graph;
    
}

G.newBeamPlot = function() {
  var beams = [1, 3, 5, 10, 15, 20, 30, 50, 100];
  var accPrune = [60, 241, 303, 341, 370, 357, 366, 361, 358];
  var oraPrune = [87, 404, 562, 682, 708, 728, 742, 758, 770];
  var accNoPrune = [70, 68, 105, 122, 144, 160, 169, 162, (157)];
  var oraNoPrune = [108, 177, 268, 353, 427, 474, 541, 582, (640)];
   
  function plotStuff(ora, acc) {
    var graph = lineGraph(
      ora.map(function (x, i) {return [beams[i], x / 10.0];}),
      acc.map(function (x, i) {return [beams[i], x / 10.0];})
      )
      .trajectoryNames(['oracle', 'accuracy'])
      .trajectoryColors(['blue', 'red'])
      .lineDasharrays([[5, 2], undefined])
      .axisLabel('beam size', 'score')
      .xrange(0, 100)
      .yrange(0, 80).ytickStartValue(0).ytickIncrValue(20)
      .length(200, 100)
      .axisLabelPadding(18);
    return graph;
  }
  return table(
    [bold('with pruning'), bold('without pruning')],
    [plotStuff(oraPrune, accPrune), plotStuff(oraNoPrune, accNoPrune)],
    _).center().margin(10, 0);
}

G.predCountHistogram = function () {
  var size = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      freq = [356, 1004, 2134, 1398, 1573, 1642, 1720, 868, 117, 230];
  var graph = barGraph(freq.map(function (x, i) {return [size[i], x];}))
    .xrange(1, 11.5)
    .yrange(0, 2500).ytickIncrValue(500)
    .length(400, 120)
    .axisLabel('formula size', 'frequency')
    .axisLabelPadding(15, 40);
  return graph;
}
