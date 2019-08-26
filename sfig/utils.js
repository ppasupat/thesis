G = sfig.serverSide ? global : this;
sfig.importAllMethods(G);

// Latex macros
sfig.latexMacro('T', 1, '\\text{\\texttt{#1}}');
sfig.latexMacro('C', 1, '\\text{\\textit{#1}}');
sfig.latexMacro('bR', 0, '\\mathbf{R}');

sfig.initialize();
G.prez = sfig.presentation();

// Useful functions (not standard enough to put into an sfig library).

G.frameBox = function(a,color) { return frame(a).padding(5).bg.strokeWidth(1).fillColor(color || 'white').end; }

G.bigLeftArrow = function(s) { return leftArrow(s || 100).strokeWidth(10).color('brown'); }
G.bigRightArrow = function(s) { return rightArrow(s || 100).strokeWidth(10).color('brown'); }
G.bigUpArrow = function(s) { return upArrow(s || 100).strokeWidth(10).color('brown'); }
G.bigDownArrow = function(s) { return downArrow(s || 100).strokeWidth(10).color('brown'); }
G.bigLeftRightArrow = function(s) { return leftRightArrow(s || 100).strokeWidth(10).color('brown'); };

G.xseq = function() { return new sfig.Table([arguments]).center().margin(5); }
G.yseq = function() { return ytable.apply(null, arguments).margin(10); }

G.stmt = function(prefix, suffix) {
  var m;
  if (!suffix && (m = prefix.match(/^([^:]+): (.+)$/))) {
    prefix = m[1];
    suffix = m[2];
  }
  return text(prefix.fontcolor('darkblue') + ':' + (suffix ? ' '+suffix : ''));
};

G.headerList = function(title) {
  var contents = Array.prototype.slice.call(arguments).slice(1);
  return ytable.apply(null, [title ? stmt(title) : _].concat(contents.map(function(line) {
    if (line == _) return _;
    if (typeof(line) == 'string') return bulletedText([null, line]);
    if (line instanceof sfig.PropertyChanger) return line;
    return indent(line);
  })));
}

G.node = function(x, shaded) { return overlay(circle(20).fillColor(shaded ? 'lightgray' : 'white') , x || _).center(); }
G.indent = function(x, n) { return frame(x).xpadding(n != null ? n : 20).xpivot(1); }
G.stagger = function(b1, b2) { b1 = std(b1); b2 = std(b2); return overlay(b1, pause(), b2.replace(b1)); }

G.dividerSlide = function(text) {
  return slide(null, nil(), parentCenter(text)).titleHeight(0);
}

G.moveLeftOf = function(a, b, offset) { return transform(a).pivot(1, 0).shift(b.left().sub(offset == null ? 5 : offset), b.ymiddle()); }
G.moveRightOf = function(a, b, offset) { return transform(a).pivot(-1, 0).shift(b.right().add(offset == null ? 5 : offset), b.ymiddle()); }
G.moveTopOf = function(a, b, offset) { return transform(a).pivot(0, 1).shift(b.xmiddle(), b.top().up(offset == null ? 5 : offset)); }
G.moveBottomOf = function(a, b, offset) { return transform(a).pivot(0, -1).shift(b.xmiddle(), b.bottom().down(offset == null ? 5 : offset)); }
G.moveCenterOf = function(a, b) { return transform(a).pivot(0, 0).shift(b.xmiddle(), b.ymiddle()); }

G.nlcolor = 'green';  // Natural language
G.zlcolor = 'red';    // Logical form
G.tlcolor = 'darkblue';
G.wlcolor = 'darkblue';   // World
G.dlcolor = 'purple'; // Denotation
G.nl = function (x) { return x.italics(); }

var colors = ['red', 'darkred', 'green', 'blue', 'darkblue', 'brown', 'purple', 'gray'];
colors.forEach(function(color) {
  G[color] = function(x) { return x.fontcolor(color); };
  G[color + 'bold'] = function(x) { return x.fontcolor(color).bold(); };
  G[color + 'italic'] = function(x) { return x.fontcolor(color).italics(); };
});

G.$c = function (x) {
  if (x == 't') return '$t$'.fontcolor(tlcolor);
  if (x == 'w') return '$w$'.fontcolor(wlcolor);
  if (x == 'x') return '$x$'.fontcolor(nlcolor);
  if (x == 'y') return '$y$'.fontcolor(dlcolor);
  if (x == 'z') return '$z$'.fontcolor(zlcolor);
  if (x == 'Zx') return '$\\mathcal{Z}_x$'.fontcolor('darkred');
  return '???';
};

////////////////////////////////////////////////////////////

