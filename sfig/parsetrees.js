G.attachChild = function(papa, child, edges, xoffset, yoffset, options) {
  if (xoffset === undefined) xoffset = 0;
  if (yoffset === undefined) yoffset = 30;
  if (options === undefined) options = {};
  child = transform(child).pivot(0, -1).shift(
    (xoffset == 0 ? papa.xmiddle() :
      xoffset > 0 ? papa.xmiddle().add(xoffset):
      papa.xmiddle().sub(-xoffset)),
    papa.bottom().down(yoffset)
  );
  if (options.arrow) {
    edges.push(decoratedLine(
        [papa.xmiddle(), papa.bottom()],
        [child.xmiddle(), child.top()]
    ).drawArrow(options.arrow[0], options.arrow[1]));
  } else {
    edges.push(line(
        [papa.xmiddle(), papa.bottom()],
        [child.xmiddle(), child.top()]
    ));
  }
  return child;
}


/* ################################################ */


G.TF = function (cat, size, semfn, lf) {
  return frame(
    ytable(
      text('$(\\C{' + cat + '},' + size + ')$').autowrap(false),
      text('$' + semfn + '$').autowrap(false),
      lf ? text('$' + lf + '$').autowrap(false) : _,
    _).margin(0).center()
  ).ypadding(8);
}


G.baseParse = function () {
  var v = [
    // 0 -> 1
    TF('Root', 5, 'z_1', '\\T{VenueOf}.\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda r [\\T{IndexOf}.r])'),
    // 1 -> 2, 3
    TF('Values', 4, '\\bR[z_1].z_2', '\\T{VenueOf}.\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda r [\\T{IndexOf}.r])'),
    // 2
    TF('Relation', 0, '\\mathrm{columns}()', '\\T{Venue}'),
    // 3 -> 4, 5
    TF('Records', 3, '\\T{argmax}(z_1, z_2)', '\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda r [\\T{IndexOf}.r])'),
    // 4 -> 6, 7
    TF('Records', 2, 'z_1.z_2', '\\T{HasPosition}.\\T{1st}'),
    // 5
    TF('RecordFn', 0, '\\lambda r[\\T{IndexOf}.r]'),
    // 6
    TF('Relation', 0, '\\mathrm{columns}()', '\\T{Position}'),
    // 7 -> 8
    TF('Values', 1, 'z_1', '\\T{1st}'),
    // 8
    TF('Entity', 0, '\\mathrm{match}(s)', '\\T{1st}'),
  ];
  var a = [
    text('$\\varnothing$'),
    text('$\\varnothing$'),
    text('$\\varnothing$'),
    "``1st''".italics(),
  ];
  var edges = [];
  function ac(i, j, xoffset) {
    v[j] = attachChild(v[i], v[j], edges, xoffset, 30);
  }
  function aca(i, j) {
    a[j] = attachChild(v[i], a[j], edges, 0, 30, {arrow: [1, 0]});
  }
  ac(0, 1);
  ac(1, 2, -200);
  ac(1, 3, 200);
  ac(3, 4, -120);
  ac(3, 5, 120);
  ac(4, 6, -100);
  ac(4, 7, 100);
  ac(7, 8);
  aca(2, 0);
  aca(5, 1);
  aca(6, 2);
  aca(8, 3);
  return overlay(
    overlay.apply(null, v),
    overlay.apply(null, a),
    overlay.apply(null, edges),
  _);
}


/* ################################################ */


G.TFA = function (cat, semfn, lf) {
  return frame(
    ytable(
      text('$\\C{' + cat + '}[' + semfn + ']$').autowrap(false),
      lf ? text('$' + lf + '$').autowrap(false) : _,
    _).margin(0).center()
  ).ypadding(8);
}


G.macroParseOrig = function () {
  var v = [
    // 0 -> 1
    TFA('Root', 'z_1', '\\T{VenueOf}.\\T{NextOf}.\\T{HasVenue}.\\T{Germany}'),
    // 1 -> 2, 3
    TFA('Values', '\\bR[z_1].z_2', '\\T{VenueOf}.\\T{NextOf}.\\T{HasVenue}.\\T{Germany}'),
    // 2
    TFA('Relation', '\\mathrm{columns}()', '\\T{Venue}'),
    // 3 -> 4
    TFA('Records', '\\T{NextOf}.z_1', '\\T{NextOf}.\\T{HasVenue}.\\T{Germany}'),
    // 4 -> 5, 6
    TFA('Records', 'z_1.z_2', '\\T{HasVenue}.\\T{Germany}'),
    // 5
    TFA('Relation', '\\mathrm{columns}()', '\\T{Venue}'),
    // 6 -> 7
    TFA('Values', 'z_1', '\\T{Germany}'),
    // 7
    TFA('Entity', '\\mathrm{fuzzymatch}(s)', '\\T{Germany}'),
  ];
  var a = [
    text('$\\varnothing$'),
    text('$\\varnothing$'),
    "``Germany''".italics(),
  ];
  var edges = [];
  function ac(i, j, xoffset) {
    v[j] = attachChild(v[i], v[j], edges, xoffset, 30);
  }
  function aca(i, j) {
    a[j] = attachChild(v[i], a[j], edges, 0, 30, {arrow: [1, 0]});
  }
  ac(0, 1);
  ac(1, 2, -150);
  ac(1, 3, 150);
  ac(3, 4);
  ac(4, 5, -120);
  ac(4, 6, 120);
  ac(6, 7);
  aca(2, 0);
  aca(5, 1);
  aca(7, 2);
  return overlay(
    overlay.apply(null, v),
    overlay.apply(null, a),
    overlay.apply(null, edges),
  _);
}


/* ################################################ */


G.TFM = function (cat, semfn) {
  return frame(
    text('$\\C{' + cat + '}[' + semfn + ']$').autowrap(false),
  ).ypadding(6);
}

G.TFP = function (cat) {
  return frame(
    frame(text('$\\C{' + cat + '}$').autowrap(false)).padding(5, 0).bg.strokeWidth(1).end,
  ).padding(5);
}

G.TFQ = function (name, color) {
  return frame(
    frame(
      text('$' + name + '$').autowrap(false).color(color)
    ).padding(5, 0).bg.strokeWidth(1).end,
  ).padding(5);
}


G.macroParseMacro = function () {
  var v = [
    // 0 -> 1
    TFM('Root', 'z_1'),
    // 1 -> 2, 3
    TFM('Values', '\\bR[z_1].z_2'),
    // 2
    nil(),
    // 3 -> 4
    TFM('Records', '\\T{NextOf}.z_1'),
    // 4 -> 5, 6
    TFM('Records', 'z_1.z_2'),
    // 5
    TFP('Relation'),
    // 6 -> 7
    TFM('Values', 'z_1'),
    // 7
    TFP('Entity'),
  ];
  var edges = [], dummy = nil();
  function ac(i, j, xoffset) {
    v[j] = attachChild(v[i], v[j], edges, xoffset, 30);
  }
  ac(0, 1);
  ac(1, 2, -80);
  ac(1, 3, 80);
  ac(3, 4);
  ac(4, 5, -60);
  ac(4, 6, 60);
  ac(6, 7);
  dummy = transform(dummy).shift(v[2].xmiddle(), v[5].ymiddle());
  edges.push(line(v[2], dummy));
  edges.push(line(v[5], dummy));
  ['red', 'blue', 'blue', 'blue', 'blue', 'blue',
    'green', 'blue', 'blue'].forEach(function (c, i) {
    edges[i].strokeWidth(2).strokeColor(c);
  });
  return overlay(
    overlay.apply(null, v),
    dummy,
    overlay.apply(null, edges),
  _);
}


G.macroParseSubMacros = function () {
  var v = [
    // 0 -> 8
    TFM('Root', 'z_1'),
    // 1 -> 2, 3
    TFM('Values', '\\bR[z_1].z_2'),
    // 2
    nil(),
    // 3 -> 4
    TFM('Records', '\\T{NextOf}.z_1'),
    // 4 -> 5, 9
    TFM('Records', 'z_1.z_2'),
    // 5
    TFP('Relation'),
    // 6 -> 7
    TFM('Values', 'z_1'),
    // 7
    TFP('Entity'),
    // 8
    TFQ('M_2', 'blue'),
    // 9
    TFQ('M_1', 'green'),
  ];
  var edges = [], dummy = nil();
  function ac(i, j, xoffset) {
    v[j] = attachChild(v[i], v[j], edges, xoffset, 30);
  }
  ac(0, 8);
  ac(1, 2, -80);
  ac(1, 3, 80);
  ac(3, 4);
  ac(4, 5, -60);
  ac(4, 9, 60);
  ac(6, 7);
  dummy = transform(dummy).shift(v[2].xmiddle(), v[5].ymiddle());
  edges.push(line(v[2], dummy));
  edges.push(line(v[5], dummy));
  ['red', 'blue', 'blue', 'blue', 'blue', 'blue',
    'green', 'blue', 'blue'].forEach(function (c, i) {
    edges[i].strokeWidth(2).strokeColor(c);
  });
  var m3 = ytable(
    overlay(v[0], v[8], edges[0]),
    'Sub-macro ' + red('$M_3$'),
  _).center().margin(5);
  var m2 = ytable(
    overlay(v[1], v[2], v[3], v[4], v[5], v[9], dummy,
      edges[1], edges[2], edges[3], edges[4], edges[5], edges[7], edges[8]),
    'Sub-macro ' + blue('$M_2$'),
  _).center().margin(5);
  var m1 = ytable(
    overlay(v[6], v[7], edges[6]),
    'Sub-macro ' + green('$M_1$'),
  _).center().margin(5);
  return xtable(ytable(m3, m1).margin(20).center(), m2).margin(40).center();
}


/* ################################################ */


G.TFD = function (cat, semfn, lf, deno) {
  return frame(
    ytable(
      text('$\\C{' + cat + '}[' + semfn + ']$').autowrap(false),
      text('$' + lf + '$').autowrap(false),
      deno ? text('$' + deno + '$').color('purple').autowrap(false) : _,
    _).margin(0).center()
  ).ypadding(8);
}


G.dpdParse = function () {
  var v = [
    // 0 -> 1, 2
    TFD('Set', '\\bR[z_2].z_1', '\\T{VenueOf}.\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda x [\\T{IndexOf}.x])', '\\{\\T{Thailand}\\}'),
    // 1 -> 3
    TFD('Set', '\\T{argmax}(u_1, \\lambda x[b_1])', '\\T{argmax}(\\T{HasPosition}.\\T{1st}, \\lambda x [\\T{IndexOf}.x])', '\\{r_4\\}'),
    // 2
    TFD('Rel', '\\mathrm{graphEdges}()', '\\T{Venue}'),
    // 3 -> 4, 5
    TFD('Map', '(u_1, \\bR[z_2].b_1)', '(\\T{HasPosition}.\\T{1st}, \\T{IndexOf}.x)', '\\{(2 ,r_2), (4, r_4)\\}'),
    // 4 -> 6
    TFD('Map', '(z_1, x)', '(\\T{HasPosition}.\\T{1st}, x)', '\\{(r_2, r_2), (r_4, r_4)\\}'),
    // 5
    TFD('Rel', '\\mathrm{graphEdges}()', '\\T{Index}'),
    // 6 -> 7, 8
    TFD('Set', 'z_2.z_1', '\\T{HasPosition}.\\T{1st}', '\\{r_2, r_4\\}'),
    // 7
    TFD('Set', '\\mathrm{fuzzymatch}(s)', '\\T{1st}', '\\{\\T{1st}\\}'),
    // 8
    TFD('Rel', '\\mathrm{graphEdges}()', '\\T{Position}'),
  ];
  var a = [
    text('$\\varnothing$'),
    text('$\\varnothing$'),
    "``1st''".italics(),
    text('$\\varnothing$'),
  ];
  var edges = [];
  function ac(i, j, xoffset) {
    v[j] = attachChild(v[i], v[j], edges, xoffset, 30);
  }
  function aca(i, j) {
    a[j] = attachChild(v[i], a[j], edges, 0, 30, {arrow: [1, 0]});
  }
  ac(0, 1, -200);
  ac(0, 2, 200);
  ac(1, 3);
  ac(3, 4, -120);
  ac(3, 5, 120);
  ac(4, 6);
  ac(6, 7, -120);
  ac(6, 8, 120);
  aca(2, 0);
  aca(5, 1);
  aca(7, 2);
  aca(8, 3);
  return overlay(
    overlay.apply(null, v),
    overlay.apply(null, a),
    overlay.apply(null, edges),
  _);
}
