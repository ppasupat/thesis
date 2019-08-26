/* ################################
   Growth of logical forms vs denotations
   ################################ */

G.exGrowth = function() {
  var yGrowth = [124, 157, 269, 679, 2204, 8378, 31320, 53254];
  var zGrowth = [187, 224, 458, 2085, 13977, 96818, 601630, 1054567];
   
  return lineGraph(
      zGrowth.map(function (x, i) {return [i, x]}),
      yGrowth.map(function (x, i) {return [i, x]})
      )
    .trajectoryNames(['\\;logical forms', '\\;denotations'])
    .trajectoryColors(['blue', 'red'])
    .lineDasharrays([[2, 1], undefined])
    .axisLabel('logical form size', 'count')
    .axisLabelPadding(25, 40)
    .tickStartValue(0).tickIncrValue(1, 200000)
    .yrange(0, 1000000)
    .ytickLabels(['0', '0.2K', '0.4K', '0.6K', '0.8K', '1.0K'])
    .legendPivot(-1, -1)
    .length(400, 150);
}

/* ################################
   Floating parser vs DPD
   ################################ */

G.exFloat = function() {
  var untrainedOracle = [0.047, 0.070, 0.093, 0.127, 0.230, 0.276, 0.347, 0.430, 0.503];
  var untrainedCandidates = [113.10, 266.05, 502.89, 937.34, 2097.42, 3841.95, 6989.89, 15387.27, 27140.69];
  var trainedOracle = [0.267, 0.307, 0.330, 0.357, 0.400, 0.437, 0.450, 0.503, 0.537];
  var trainedCandidates = [96.49, 226.31, 427.92, 806.15, 1834.65, 3394.61, 6266.28, 13860.60, 25022.01];
  var dpdOracle = 0.76;
  var dpdCandidates = 20244.39;

  return lineGraph(
      untrainedOracle.map(function (x, i) {return [untrainedCandidates[i], x]}),
      trainedOracle.map(function (x, i) {return [trainedCandidates[i], x]}),
      [[dpdCandidates, dpdOracle]]
      )
    .trajectoryNames(['\\;untrained', '\\;trained', '\\;DPD'])
    .trajectoryColors(['blue', 'red', 'green'])
    .marker(function (x, color) {
      if (x == 2)
        return transform(text('$\\star$').color(color)).center().scale(1.3);
      return nil();
    })
    .lineDasharrays([[2, 1], undefined, undefined])
    .axisLabel('number of final LFs produced', 'annotated LFs coverage')
    .axisLabelPadding(25, 30)
    .ytickIncrValue(0.2).yrange(0, 0.8).yroundPlaces(1)
    .xtickIncrValue(5000).xrange(0, 26000)
    .length(400, 150);
}

/* ################################
   Knowledge graph
   ################################ */

G.knowledgeGraph = function() {
  // Node
  function n(x) { return frameBox(x).padding(10,3); }
  function z1(x) { return x.bg.fillColor('#FFA').end; }
  function z2(x) { return x.bg.fillColor('#FCF').end; }
  function z3(x) { return x.bg.strokeColor('blue').strokeDasharray([3, 1]).strokeWidth(2).end; }
  function z4(x) { return x.bg.strokeColor('red').strokeWidth(3).end; }
  
  var row0 = n('$r_1$'), row1 = z2(n('$r_2$')), row2 = n('$r_3$'), row3 = z3(z2(n('$r_4$'))),
      id0 = n('$\\C{1}$'), id1 = n('$\\C{2}$'), id2 = n('$\\C{3}$'), id3 = n('$\\C{4}$'),
      venue0 = n("$\\T{Hungary}$"), position0 = n("$\\T{2nd}$"),
      venue1 = n("$\\T{Finland}$"), position1 = z1(n("$\\T{1st}$")),
      venue2 = n("$\\T{Germany}$"), position2 = n("$\\T{11th}$"),
      venue3 = z4(n("$\\T{Thailand}$")), position3 = z1(n("$\\T{1st}$")),
      prop0 = n('$\\C{2}$'),
      prop1 = n('$\\C{1}$'),
      prop2 = n('$\\C{11}$'),
      prop3 = n('$\\C{1}$'),
      anchor0 = frame('$\\cdots$').padding(10),
      anchor1 = frame('$\\cdots$').padding(10),
      anchor2 = frame('$\\cdots$').padding(10),
      anchor3 = frame('$\\cdots$').padding(10),
      anchor4 = text('$\\vdots$'),
      b01 = nil(), b02 = nil(), b11 = nil(), b12 = nil(), b21 = nil(), b22 = nil(), b31 = nil(), b32 = nil();
  function curveArrow(s, t) {
    return arrow([s.left().sub(30), s.ymiddle()], t);
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
    lbl(arrow(row0, row1), 'Next', -1, 0, 8, -12),
    lbl(arrow(row1, row2), 'Next', -1, 0, 8, -12),
    lbl(arrow(row2, row3), 'Next', -1, 0, 8, -12),
    lbl(arrow(row3, anchor4), 'Next', -1, 0, 8, -12),
    lbl(arrow(row0, id0), 'Index', 1, 1, 5, -5),
    lbl(arrow(row1, id1), 'Index', 1, 1, 5, -5),
    lbl(arrow(row2, id2), 'Index', 1, 1, 5, -5),
    lbl(arrow(row3, id3), 'Index', 1, 1, 5, -5),
    line(row0, anchor0),
    line(row1, anchor1),
    line(row2, anchor2),
    line(row3, anchor3),
    lbl(curveArrow(b01, venue0), 'Venue', -1, 0, 12),
    lbl(curveArrow(b02, position0), 'Position', -1, 0, 15),
    lbl(curveArrow(b11, venue1), 'Venue', -1, 0, 12),
    lbl(curveArrow(b12, position1), 'Position', -1, 0, 15),
    lbl(curveArrow(b21, venue2), 'Venue', -1, 0, 12),
    lbl(curveArrow(b22, position2), 'Position', -1, 0, 15),
    lbl(curveArrow(b31, venue3), 'Venue', -1, 0, 12),
    lbl(curveArrow(b32, position3), 'Position', -1, 0, 15),
    lbl(arrow(position0, prop0), 'Num', 0, -1, 0, 0),
    lbl(arrow(position1, prop1), 'Num', 0, -1, 0, 0),
    lbl(arrow(position2, prop2), 'Num', 0, -1, 0, 0),
    lbl(arrow(position3, prop3), 'Num', 0, -1, 0, 0),
    _);
  var graph = overlay(
    table(
      [nil(), row0, b01, b02, anchor0],
      [id0, nil(), venue0, position0, nil()],
      [nil(), row1, b11, b12, anchor1],
      [id1, nil(), venue1, position1, nil()],
      [nil(), row2, b21, b22, anchor2],
      [id2, nil(), venue2, position2, nil()],
      [nil(), row3, b31, b32, anchor3],
      [id3, nil(), venue3, position3, nil()],
      [nil(), anchor4, nil(), nil(), nil()],
      _).center().margin(50, 12),
    transform(prop0).pivot(-1, 0).shift(position0.xmiddle().add(130), position0.ymiddle().down(20)),
    transform(prop1).pivot(-1, 0).shift(position1.xmiddle().add(130), position1.ymiddle().down(20)),
    transform(prop2).pivot(-1, 0).shift(position2.xmiddle().add(130), position2.ymiddle().down(20)),
    transform(prop3).pivot(-1, 0).shift(position3.xmiddle().add(130), position3.ymiddle().down(20)),
    overlay.apply(null, arrows),
    _);
  var caption = xtable(
      '$z_1 =$',
      z4(frame(xtable(
        '$\\T{VenueOf}.$',
        z3(frame(xtable(
          '$\\T{argmax}($',
          z2(frame(xtable(
            '$\\T{HasPosition}.$',
            z1(frame('$\\T{1st}$')).padding(3).center(),
            _).center())).padding(5).center(),
          '$,\\lambda r[\\T{IndexOf}.r])$',
          _).center())).padding(3).center(),
        _).center())).padding(5).center(),
      _).center().margin(2);
  return ytable(
      graph,
      caption,
      _).center();
}

/* ################################
   Conceptual graph for DPD
   ################################ */

G.dpdConcept = function () {
  var XMARGIN = 60, YMARGIN = 20;
  var s = [], o = [], i;
  for (i = 0; i < 12; i++) s.push(square(25));
  for (i = 0; i < 7; i++) o.push(circle(15));
  var t1 = overlay(o[0], moveLeftOf(ytable(s[0], s[1]).margin(YMARGIN), o[0], XMARGIN));
  var t2 = overlay(o[1], moveLeftOf(s[2], o[1], XMARGIN));
  var t3 = overlay(o[2], moveLeftOf(s[3], o[2], XMARGIN));
  var t4 = overlay(o[3], moveLeftOf(ytable(s[4], s[5]).margin(YMARGIN), o[3], XMARGIN));
  var t5 = overlay(s[6], moveLeftOf(ytable(t1, t2).margin(YMARGIN), s[6], XMARGIN));
  var t6 = overlay(s[7], moveLeftOf(ytable(t3, t4).margin(YMARGIN), s[7], XMARGIN));
  var t7 = overlay(o[4], moveLeftOf(ytable(t5, t6).margin(YMARGIN), o[4], XMARGIN));
  var next = frame(gray('$\\cdots$')).padding(20);
  function barrow(x, y) { return arrow(x, y).strokeColor('blue').strokeWidth(2); }
  function garrow(x, y) { return arrow(x, y).strokeColor('black').strokeDasharray([2,0]); }
  var arrows = [].concat(
    barrow(s[0], o[0]), barrow(s[1], o[0]),
    barrow(s[2], o[1]), garrow(s[3], o[2]), garrow(s[2], o[2]),
    garrow(s[4], o[3]), garrow(s[5], o[3]),
    barrow(o[0], s[6]), barrow(o[1], s[6]),
    garrow(o[2], s[7]), 
    garrow(o[3], s[7]),
    garrow(s[6], o[4]), barrow(s[6], o[5]),
    garrow(s[7], o[4]),
    garrow(o[4], s[9]), barrow(o[5], s[10]),
    garrow(s[7], o[6]), garrow(o[6], s[11]),
    garrow(s[9], next),
    _);
  [s[0], s[1], s[2], o[0], o[1], s[6], s[8], o[5], s[10]].forEach(function (x) {
    x.strokeColor('blue').strokeWidth(2);
  });
  [s[3], s[4], s[5], o[2], o[3], s[7], o[4], s[9], o[6], s[11]].forEach(function (x) {
    x.strokeColor('black').strokeDasharray([2,0]);
  });
  s[10].fillColor('#CFF');
  return overlay(
    t7,
    moveRightOf(s[9], o[4], XMARGIN),
    moveRightOf(o[5], s[6], XMARGIN),
    moveRightOf(s[10], o[5], XMARGIN),
    moveRightOf(o[6], s[7], XMARGIN),
    moveRightOf(s[11], o[6], XMARGIN),
    moveRightOf(next, s[9], XMARGIN),
    moveLeftOf(blue('$\\cdots$'), s[0], 20),
    moveLeftOf(blue('$\\cdots$'), s[1], 20),
    moveLeftOf(blue('$\\cdots$'), s[2], 20),
    moveLeftOf(gray('$\\cdots$'), s[3], 20),
    moveLeftOf(gray('$\\cdots$'), s[4], 20),
    moveLeftOf(gray('$\\cdots$'), s[5], 20),
    overlay.apply(null, arrows),
    moveTopOf(ytable('$(\\C{Set}, 7,$', '$\\{\\T{Thailand}\\})$').scale(0.8), s[10], 10),
    moveBottomOf(ytable('$(\\C{Set}, 7,$', '$\\{\\T{Finland}\\})$').scale(0.8), s[11], 10),
    _);
}
