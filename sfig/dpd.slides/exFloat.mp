verbatimtex
%&latex
\documentclass{article}
\usepackage{color,xcolor,amsmath,amssymb,ulem,verbatim,ifthen}
\renewcommand{\familydefault}{\rmdefault}
etex
verbatimtex
\renewcommand{\rmdefault}{ptm}
etex
verbatimtex
\providecommand{\white}{}
\renewcommand{\white}[1]{{\textcolor{rgb,1:red,1;green,1;blue,1}{#1}}}
\providecommand{\black}{}
\renewcommand{\black}[1]{{\textcolor{rgb,1:red,0;green,0;blue,0}{#1}}}
\providecommand{\silver}{}
\renewcommand{\silver}[1]{{\textcolor{rgb,1:red,0.7529411764705882;green,0.7529411764705882;blue,0.7529411764705882}{#1}}}
\providecommand{\gray}{}
\renewcommand{\gray}[1]{{\textcolor{rgb,1:red,0.5019607843137255;green,0.5019607843137255;blue,0.5019607843137255}{#1}}}
\providecommand{\lightgray}{}
\renewcommand{\lightgray}[1]{{\textcolor{rgb,1:red,0.8274509803921568;green,0.8274509803921568;blue,0.8274509803921568}{#1}}}
\providecommand{\darkgray}{}
\renewcommand{\darkgray}[1]{{\textcolor{rgb,1:red,0.6627450980392157;green,0.6627450980392157;blue,0.6627450980392157}{#1}}}
\providecommand{\red}{}
\renewcommand{\red}[1]{{\textcolor{rgb,1:red,1;green,0;blue,0}{#1}}}
\providecommand{\blue}{}
\renewcommand{\blue}[1]{{\textcolor{rgb,1:red,0;green,0;blue,1}{#1}}}
\providecommand{\green}{}
\renewcommand{\green}[1]{{\textcolor{rgb,1:red,0;green,0.5019607843137255;blue,0}{#1}}}
\providecommand{\lightgreen}{}
\renewcommand{\lightgreen}[1]{{\textcolor{rgb,1:red,0.5647058823529412;green,0.9333333333333333;blue,0.5647058823529412}{#1}}}
\providecommand{\darkred}{}
\renewcommand{\darkred}[1]{{\textcolor{rgb,1:red,0.5450980392156862;green,0;blue,0}{#1}}}
\providecommand{\darkblue}{}
\renewcommand{\darkblue}[1]{{\textcolor{rgb,1:red,0;green,0;blue,0.6274509803921569}{#1}}}
\providecommand{\lightblue}{}
\renewcommand{\lightblue}[1]{{\textcolor{rgb,1:red,0.6784313725490196;green,0.8470588235294118;blue,0.9019607843137255}{#1}}}
\providecommand{\cyan}{}
\renewcommand{\cyan}[1]{{\textcolor{rgb,1:red,0;green,1;blue,1}{#1}}}
\providecommand{\orange}{}
\renewcommand{\orange}[1]{{\textcolor{rgb,1:red,1;green,0.6470588235294118;blue,0}{#1}}}
\providecommand{\purple}{}
\renewcommand{\purple}[1]{{\textcolor{rgb,1:red,0.5019607843137255;green,0;blue,0.5019607843137255}{#1}}}
\providecommand{\brown}{}
\renewcommand{\brown}[1]{{\textcolor{rgb,1:red,0.6470588235294118;green,0.16470588235294117;blue,0.16470588235294117}{#1}}}
\providecommand{\yellow}{}
\renewcommand{\yellow}[1]{{\textcolor{rgb,1:red,1;green,1;blue,0}{#1}}}
\providecommand{\maroon}{}
\renewcommand{\maroon}[1]{{\textcolor{rgb,1:red,0.5019607843137255;green,0;blue,0}{#1}}}
\providecommand{\lime}{}
\renewcommand{\lime}[1]{{\textcolor{rgb,1:red,0;green,1;blue,0}{#1}}}
\providecommand{\fuchsia}{}
\renewcommand{\fuchsia}[1]{{\textcolor{rgb,1:red,1;green,0;blue,1}{#1}}}
\providecommand{\olive}{}
\renewcommand{\olive}[1]{{\textcolor{rgb,1:red,0.5019607843137255;green,0.5019607843137255;blue,0}{#1}}}
\providecommand{\pink}{}
\renewcommand{\pink}[1]{{\textcolor{rgb,1:red,0.9803921568627451;green,0.6862745098039216;blue,0.7450980392156863}{#1}}}
\providecommand{\foo}{}
\renewcommand{\foo}[1]{{\textcolor{rgb,1:red,1;green,0;blue,0}{#1}}}
\providecommand{\T}{}
\renewcommand{\T}[1]{\text{\texttt{#1}}}
\providecommand{\C}{}
\renewcommand{\C}[1]{\text{\textit{#1}}}
\providecommand{\bR}{}
\renewcommand{\bR}[0]{\mathbf{R}}
etex
verbatimtex
\begin{document}
etex
vardef L(expr p) = xpart(ulcorner p) enddef;
vardef R(expr p) = xpart(urcorner p) enddef;
vardef T(expr p) = ypart(ulcorner p) enddef;
vardef B(expr p) = ypart(llcorner p) enddef;
vardef W(expr p) = xpart(urcorner p) - xpart(ulcorner p) enddef;
vardef H(expr p) = ypart(urcorner p) - ypart(lrcorner p) enddef;
vardef mybbox(expr p) = (ulcorner p--urcorner p--lrcorner p--llcorner p--cycle) enddef;

textyl := ypart lrcorner image(draw btex g etex) * 2;
textyu := ypart urcorner image(draw btex l etex) * 1.5;
linejoin := mitered;
linecap := butt;
def hackTextBounds =
  setbounds currentpicture to ((xpart llcorner currentpicture), min(ypart llcorner currentpicture, textyl))--
                              ((xpart lrcorner currentpicture), min(ypart lrcorner currentpicture, textyl))--
                              ((xpart urcorner currentpicture), max(ypart urcorner currentpicture, textyu))--
                              ((xpart ulcorner currentpicture), max(ypart ulcorner currentpicture, textyu))--
                              cycle;
enddef;
numeric n[];
pair r[];
path h[];
picture p[];
color c[];
h1 := ((0,0)--(410,0));
p1 := image(draw h1);
h2 := ((0,0)--(0,-3));
p2 := image(draw h2);
p3 := image(draw btex 0 etex; hackTextBounds) scaled 2.5454545454545454;
p4 := (p3 yshifted (-H(p3)));
p5 := nullpicture;
addto p5 also p4;
n1 := ((L(p4)*-0.5)+((L(p4)+W(p4))*-0.5));
n2 := (T(p4)*-1);
p5 := (p5 xshifted n1);
p5 := (p5 yshifted n2);
p4 := (p4 xshifted n1);
p4 := (p4 yshifted n2);
p6 := nullpicture;
addto p6 also p5;
p6 := (p6 xscaled 0.7);
p6 := (p6 yscaled 0.7);
p6 := (p6 yshifted -3);
p5 := (p5 xscaled 0.7);
p5 := (p5 yscaled 0.7);
p5 := (p5 yshifted -3);
p4 := (p4 xscaled 0.7);
p4 := (p4 yscaled 0.7);
p4 := (p4 yshifted -3);
h3 := ((76.92308,0)--(76.92308,-3));
p7 := image(draw h3);
p8 := image(draw btex 5000 etex; hackTextBounds) scaled 2.5454545454545454;
p9 := (p8 yshifted (-H(p8)));
p10 := nullpicture;
addto p10 also p9;
n3 := ((L(p9)*-0.5)+((L(p9)+W(p9))*-0.5));
n4 := (T(p9)*-1);
p10 := (p10 xshifted n3);
p10 := (p10 yshifted n4);
p9 := (p9 xshifted n3);
p9 := (p9 yshifted n4);
p11 := nullpicture;
addto p11 also p10;
p11 := (p11 xscaled 0.7);
p11 := (p11 yscaled 0.7);
p11 := (p11 xshifted 76.92308);
p11 := (p11 yshifted -3);
p10 := (p10 xscaled 0.7);
p10 := (p10 yscaled 0.7);
p10 := (p10 xshifted 76.92308);
p10 := (p10 yshifted -3);
p9 := (p9 xscaled 0.7);
p9 := (p9 yscaled 0.7);
p9 := (p9 xshifted 76.92308);
p9 := (p9 yshifted -3);
h4 := ((153.84615,0)--(153.84615,-3));
p12 := image(draw h4);
p13 := image(draw btex 10000 etex; hackTextBounds) scaled 2.5454545454545454;
p14 := (p13 yshifted (-H(p13)));
p15 := nullpicture;
addto p15 also p14;
n5 := ((L(p14)*-0.5)+((L(p14)+W(p14))*-0.5));
n6 := (T(p14)*-1);
p15 := (p15 xshifted n5);
p15 := (p15 yshifted n6);
p14 := (p14 xshifted n5);
p14 := (p14 yshifted n6);
p16 := nullpicture;
addto p16 also p15;
p16 := (p16 xscaled 0.7);
p16 := (p16 yscaled 0.7);
p16 := (p16 xshifted 153.84615);
p16 := (p16 yshifted -3);
p15 := (p15 xscaled 0.7);
p15 := (p15 yscaled 0.7);
p15 := (p15 xshifted 153.84615);
p15 := (p15 yshifted -3);
p14 := (p14 xscaled 0.7);
p14 := (p14 yscaled 0.7);
p14 := (p14 xshifted 153.84615);
p14 := (p14 yshifted -3);
h5 := ((230.76923,0)--(230.76923,-3));
p17 := image(draw h5);
p18 := image(draw btex 15000 etex; hackTextBounds) scaled 2.5454545454545454;
p19 := (p18 yshifted (-H(p18)));
p20 := nullpicture;
addto p20 also p19;
n7 := ((L(p19)*-0.5)+((L(p19)+W(p19))*-0.5));
n8 := (T(p19)*-1);
p20 := (p20 xshifted n7);
p20 := (p20 yshifted n8);
p19 := (p19 xshifted n7);
p19 := (p19 yshifted n8);
p21 := nullpicture;
addto p21 also p20;
p21 := (p21 xscaled 0.7);
p21 := (p21 yscaled 0.7);
p21 := (p21 xshifted 230.76923);
p21 := (p21 yshifted -3);
p20 := (p20 xscaled 0.7);
p20 := (p20 yscaled 0.7);
p20 := (p20 xshifted 230.76923);
p20 := (p20 yshifted -3);
p19 := (p19 xscaled 0.7);
p19 := (p19 yscaled 0.7);
p19 := (p19 xshifted 230.76923);
p19 := (p19 yshifted -3);
h6 := ((307.69231,0)--(307.69231,-3));
p22 := image(draw h6);
p23 := image(draw btex 20000 etex; hackTextBounds) scaled 2.5454545454545454;
p24 := (p23 yshifted (-H(p23)));
p25 := nullpicture;
addto p25 also p24;
n9 := ((L(p24)*-0.5)+((L(p24)+W(p24))*-0.5));
n10 := (T(p24)*-1);
p25 := (p25 xshifted n9);
p25 := (p25 yshifted n10);
p24 := (p24 xshifted n9);
p24 := (p24 yshifted n10);
p26 := nullpicture;
addto p26 also p25;
p26 := (p26 xscaled 0.7);
p26 := (p26 yscaled 0.7);
p26 := (p26 xshifted 307.69231);
p26 := (p26 yshifted -3);
p25 := (p25 xscaled 0.7);
p25 := (p25 yscaled 0.7);
p25 := (p25 xshifted 307.69231);
p25 := (p25 yshifted -3);
p24 := (p24 xscaled 0.7);
p24 := (p24 yscaled 0.7);
p24 := (p24 xshifted 307.69231);
p24 := (p24 yshifted -3);
h7 := ((384.61538,0)--(384.61538,-3));
p27 := image(draw h7);
p28 := image(draw btex 25000 etex; hackTextBounds) scaled 2.5454545454545454;
p29 := (p28 yshifted (-H(p28)));
p30 := nullpicture;
addto p30 also p29;
n11 := ((L(p29)*-0.5)+((L(p29)+W(p29))*-0.5));
n12 := (T(p29)*-1);
p30 := (p30 xshifted n11);
p30 := (p30 yshifted n12);
p29 := (p29 xshifted n11);
p29 := (p29 yshifted n12);
p31 := nullpicture;
addto p31 also p30;
p31 := (p31 xscaled 0.7);
p31 := (p31 yscaled 0.7);
p31 := (p31 xshifted 384.61538);
p31 := (p31 yshifted -3);
p30 := (p30 xscaled 0.7);
p30 := (p30 yscaled 0.7);
p30 := (p30 xshifted 384.61538);
p30 := (p30 yshifted -3);
p29 := (p29 xscaled 0.7);
p29 := (p29 yscaled 0.7);
p29 := (p29 xshifted 384.61538);
p29 := (p29 yshifted -3);
p32 := image(draw btex number of final LFs produced etex; hackTextBounds) scaled 2.5454545454545454;
p33 := (p32 yshifted (-H(p32)));
p34 := nullpicture;
addto p34 also p33;
n13 := ((L(p33)*-0.5)+((L(p33)+W(p33))*-0.5));
n14 := (T(p33)*-1);
p34 := (p34 xshifted n13);
p34 := (p34 yshifted n14);
p33 := (p33 xshifted n13);
p33 := (p33 yshifted n14);
p35 := nullpicture;
addto p35 also p34;
p35 := (p35 xshifted 200);
p35 := (p35 yshifted -25);
p34 := (p34 xshifted 200);
p34 := (p34 yshifted -25);
p33 := (p33 xshifted 200);
p33 := (p33 yshifted -25);
h8 := ((0,0)--(0,160));
p36 := image(draw h8);
p37 := image(draw btex 0.0 etex; hackTextBounds) scaled 2.5454545454545454;
p38 := (p37 yshifted (-H(p37)));
p39 := nullpicture;
addto p39 also p38;
n15 := ((L(p38)+W(p38))*-1);
n16 := ((T(p38)*-0.5)+((T(p38)-H(p38))*-0.5));
p39 := (p39 xshifted n15);
p39 := (p39 yshifted n16);
p38 := (p38 xshifted n15);
p38 := (p38 yshifted n16);
p40 := nullpicture;
addto p40 also p39;
p40 := (p40 xscaled 0.7);
p40 := (p40 yscaled 0.7);
p40 := (p40 xshifted -3);
p39 := (p39 xscaled 0.7);
p39 := (p39 yscaled 0.7);
p39 := (p39 xshifted -3);
p38 := (p38 xscaled 0.7);
p38 := (p38 yscaled 0.7);
p38 := (p38 xshifted -3);
h9 := ((0,37.5)--(400,37.5));
p41 := image(draw h9 withcolor (0.82745,0.82745,0.82745));
p42 := image(draw btex 0.2 etex; hackTextBounds) scaled 2.5454545454545454;
p43 := (p42 yshifted (-H(p42)));
p44 := nullpicture;
addto p44 also p43;
n17 := ((L(p43)+W(p43))*-1);
n18 := ((T(p43)*-0.5)+((T(p43)-H(p43))*-0.5));
p44 := (p44 xshifted n17);
p44 := (p44 yshifted n18);
p43 := (p43 xshifted n17);
p43 := (p43 yshifted n18);
p45 := nullpicture;
addto p45 also p44;
p45 := (p45 xscaled 0.7);
p45 := (p45 yscaled 0.7);
p45 := (p45 xshifted -3);
p45 := (p45 yshifted 37.5);
p44 := (p44 xscaled 0.7);
p44 := (p44 yscaled 0.7);
p44 := (p44 xshifted -3);
p44 := (p44 yshifted 37.5);
p43 := (p43 xscaled 0.7);
p43 := (p43 yscaled 0.7);
p43 := (p43 xshifted -3);
p43 := (p43 yshifted 37.5);
h10 := ((0,75)--(400,75));
p46 := image(draw h10 withcolor (0.82745,0.82745,0.82745));
p47 := image(draw btex 0.4 etex; hackTextBounds) scaled 2.5454545454545454;
p48 := (p47 yshifted (-H(p47)));
p49 := nullpicture;
addto p49 also p48;
n19 := ((L(p48)+W(p48))*-1);
n20 := ((T(p48)*-0.5)+((T(p48)-H(p48))*-0.5));
p49 := (p49 xshifted n19);
p49 := (p49 yshifted n20);
p48 := (p48 xshifted n19);
p48 := (p48 yshifted n20);
p50 := nullpicture;
addto p50 also p49;
p50 := (p50 xscaled 0.7);
p50 := (p50 yscaled 0.7);
p50 := (p50 xshifted -3);
p50 := (p50 yshifted 75);
p49 := (p49 xscaled 0.7);
p49 := (p49 yscaled 0.7);
p49 := (p49 xshifted -3);
p49 := (p49 yshifted 75);
p48 := (p48 xscaled 0.7);
p48 := (p48 yscaled 0.7);
p48 := (p48 xshifted -3);
p48 := (p48 yshifted 75);
h11 := ((0,112.5)--(400,112.5));
p51 := image(draw h11 withcolor (0.82745,0.82745,0.82745));
p52 := image(draw btex 0.6 etex; hackTextBounds) scaled 2.5454545454545454;
p53 := (p52 yshifted (-H(p52)));
p54 := nullpicture;
addto p54 also p53;
n21 := ((L(p53)+W(p53))*-1);
n22 := ((T(p53)*-0.5)+((T(p53)-H(p53))*-0.5));
p54 := (p54 xshifted n21);
p54 := (p54 yshifted n22);
p53 := (p53 xshifted n21);
p53 := (p53 yshifted n22);
p55 := nullpicture;
addto p55 also p54;
p55 := (p55 xscaled 0.7);
p55 := (p55 yscaled 0.7);
p55 := (p55 xshifted -3);
p55 := (p55 yshifted 112.5);
p54 := (p54 xscaled 0.7);
p54 := (p54 yscaled 0.7);
p54 := (p54 xshifted -3);
p54 := (p54 yshifted 112.5);
p53 := (p53 xscaled 0.7);
p53 := (p53 yscaled 0.7);
p53 := (p53 xshifted -3);
p53 := (p53 yshifted 112.5);
h12 := ((0,150)--(400,150));
p56 := image(draw h12 withcolor (0.82745,0.82745,0.82745));
p57 := image(draw btex 0.8 etex; hackTextBounds) scaled 2.5454545454545454;
p58 := (p57 yshifted (-H(p57)));
p59 := nullpicture;
addto p59 also p58;
n23 := ((L(p58)+W(p58))*-1);
n24 := ((T(p58)*-0.5)+((T(p58)-H(p58))*-0.5));
p59 := (p59 xshifted n23);
p59 := (p59 yshifted n24);
p58 := (p58 xshifted n23);
p58 := (p58 yshifted n24);
p60 := nullpicture;
addto p60 also p59;
p60 := (p60 xscaled 0.7);
p60 := (p60 yscaled 0.7);
p60 := (p60 xshifted -3);
p60 := (p60 yshifted 150);
p59 := (p59 xscaled 0.7);
p59 := (p59 yscaled 0.7);
p59 := (p59 xshifted -3);
p59 := (p59 yshifted 150);
p58 := (p58 xscaled 0.7);
p58 := (p58 yscaled 0.7);
p58 := (p58 xshifted -3);
p58 := (p58 yshifted 150);
p61 := image(draw btex annotated LFs coverage etex; hackTextBounds) scaled 2.5454545454545454;
p62 := (p61 yshifted (-H(p61)));
p62 := (p62 rotated 90);
p63 := nullpicture;
addto p63 also p62;
n25 := ((L(p62)+W(p62))*-1);
n26 := ((T(p62)*-0.5)+((T(p62)-H(p62))*-0.5));
p63 := (p63 xshifted n25);
p63 := (p63 yshifted n26);
p62 := (p62 xshifted n25);
p62 := (p62 yshifted n26);
p64 := nullpicture;
addto p64 also p63;
p64 := (p64 xshifted -30);
p64 := (p64 yshifted 75);
p63 := (p63 xshifted -30);
p63 := (p63 yshifted 75);
p62 := (p62 xshifted -30);
p62 := (p62 yshifted 75);
h13 := (((fullcircle) xscaled 0) yscaled 0);
p65 := image(draw h13);
p65 := (p65 xshifted 1.74);
p65 := (p65 yshifted 8.8125);
h14 := ((1.74,8.8125)--(4.09308,13.125));
p66 := image(draw h14 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h15 := (((fullcircle) xscaled 0) yscaled 0);
p67 := image(draw h15);
p67 := (p67 xshifted 4.09308);
p67 := (p67 yshifted 13.125);
h16 := ((4.09308,13.125)--(7.73677,17.4375));
p68 := image(draw h16 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h17 := (((fullcircle) xscaled 0) yscaled 0);
p69 := image(draw h17);
p69 := (p69 xshifted 7.73677);
p69 := (p69 yshifted 17.4375);
h18 := ((7.73677,17.4375)--(14.42062,23.8125));
p70 := image(draw h18 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h19 := (((fullcircle) xscaled 0) yscaled 0);
p71 := image(draw h19);
p71 := (p71 xshifted 14.42062);
p71 := (p71 yshifted 23.8125);
h20 := ((14.42062,23.8125)--(32.268,43.125));
p72 := image(draw h20 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h21 := (((fullcircle) xscaled 0) yscaled 0);
p73 := image(draw h21);
p73 := (p73 xshifted 32.268);
p73 := (p73 yshifted 43.125);
h22 := ((32.268,43.125)--(59.10692,51.75));
p74 := image(draw h22 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h23 := (((fullcircle) xscaled 0) yscaled 0);
p75 := image(draw h23);
p75 := (p75 xshifted 59.10692);
p75 := (p75 yshifted 51.75);
h24 := ((59.10692,51.75)--(107.53677,65.0625));
p76 := image(draw h24 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h25 := (((fullcircle) xscaled 0) yscaled 0);
p77 := image(draw h25);
p77 := (p77 xshifted 107.53677);
p77 := (p77 yshifted 65.0625);
h26 := ((107.53677,65.0625)--(236.72723,80.625));
p78 := image(draw h26 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h27 := (((fullcircle) xscaled 0) yscaled 0);
p79 := image(draw h27);
p79 := (p79 xshifted 236.72723);
p79 := (p79 yshifted 80.625);
h28 := ((236.72723,80.625)--(417.54908,94.3125));
p80 := image(draw h28 withcolor (0,0,1) withpen pencircle scaled 2 dashed evenly scaled 2);
h29 := (((fullcircle) xscaled 0) yscaled 0);
p81 := image(draw h29);
p81 := (p81 xshifted 417.54908);
p81 := (p81 yshifted 94.3125);
h30 := (((fullcircle) xscaled 0) yscaled 0);
p82 := image(draw h30);
p82 := (p82 xshifted 1.48446);
p82 := (p82 yshifted 50.0625);
h31 := ((1.48446,50.0625)--(3.48169,57.5625));
p83 := image(draw h31 withcolor (1,0,0) withpen pencircle scaled 2);
h32 := (((fullcircle) xscaled 0) yscaled 0);
p84 := image(draw h32);
p84 := (p84 xshifted 3.48169);
p84 := (p84 yshifted 57.5625);
h33 := ((3.48169,57.5625)--(6.58338,61.875));
p85 := image(draw h33 withcolor (1,0,0) withpen pencircle scaled 2);
h34 := (((fullcircle) xscaled 0) yscaled 0);
p86 := image(draw h34);
p86 := (p86 xshifted 6.58338);
p86 := (p86 yshifted 61.875);
h35 := ((6.58338,61.875)--(12.40231,66.9375));
p87 := image(draw h35 withcolor (1,0,0) withpen pencircle scaled 2);
h36 := (((fullcircle) xscaled 0) yscaled 0);
p88 := image(draw h36);
p88 := (p88 xshifted 12.40231);
p88 := (p88 yshifted 66.9375);
h37 := ((12.40231,66.9375)--(28.22538,75));
p89 := image(draw h37 withcolor (1,0,0) withpen pencircle scaled 2);
h38 := (((fullcircle) xscaled 0) yscaled 0);
p90 := image(draw h38);
p90 := (p90 xshifted 28.22538);
p90 := (p90 yshifted 75);
h39 := ((28.22538,75)--(52.22477,81.9375));
p91 := image(draw h39 withcolor (1,0,0) withpen pencircle scaled 2);
h40 := (((fullcircle) xscaled 0) yscaled 0);
p92 := image(draw h40);
p92 := (p92 xshifted 52.22477);
p92 := (p92 yshifted 81.9375);
h41 := ((52.22477,81.9375)--(96.40431,84.375));
p93 := image(draw h41 withcolor (1,0,0) withpen pencircle scaled 2);
h42 := (((fullcircle) xscaled 0) yscaled 0);
p94 := image(draw h42);
p94 := (p94 xshifted 96.40431);
p94 := (p94 yshifted 84.375);
h43 := ((96.40431,84.375)--(213.24,94.3125));
p95 := image(draw h43 withcolor (1,0,0) withpen pencircle scaled 2);
h44 := (((fullcircle) xscaled 0) yscaled 0);
p96 := image(draw h44);
p96 := (p96 xshifted 213.24);
p96 := (p96 yshifted 94.3125);
h45 := ((213.24,94.3125)--(384.954,100.6875));
p97 := image(draw h45 withcolor (1,0,0) withpen pencircle scaled 2);
h46 := (((fullcircle) xscaled 0) yscaled 0);
p98 := image(draw h46);
p98 := (p98 xshifted 384.954);
p98 := (p98 yshifted 100.6875);
p99 := image(draw btex $\star$ etex withcolor (0,0.50196,0); hackTextBounds) scaled 2.5454545454545454;
p100 := (p99 yshifted (-H(p99)));
p101 := nullpicture;
addto p101 also p100;
n27 := ((L(p100)*-0.5)+((L(p100)+W(p100))*-0.5));
n28 := ((T(p100)*-0.5)+((T(p100)-H(p100))*-0.5));
p101 := (p101 xshifted n27);
p101 := (p101 yshifted n28);
p100 := (p100 xshifted n27);
p100 := (p100 yshifted n28);
p102 := nullpicture;
addto p102 also p101;
p102 := (p102 xscaled 1.3);
p102 := (p102 yscaled 1.3);
p102 := (p102 xshifted 311.45215);
p102 := (p102 yshifted 142.5);
p101 := (p101 xscaled 1.3);
p101 := (p101 yscaled 1.3);
p101 := (p101 xshifted 311.45215);
p101 := (p101 yshifted 142.5);
p100 := (p100 xscaled 1.3);
p100 := (p100 yscaled 1.3);
p100 := (p100 xshifted 311.45215);
p100 := (p100 yshifted 142.5);
p103 := nullpicture;
addto p103 also p1;
addto p103 also p2;
addto p103 also p6;
addto p103 also p7;
addto p103 also p11;
addto p103 also p12;
addto p103 also p16;
addto p103 also p17;
addto p103 also p21;
addto p103 also p22;
addto p103 also p26;
addto p103 also p27;
addto p103 also p31;
addto p103 also p35;
addto p103 also p36;
addto p103 also p40;
addto p103 also p41;
addto p103 also p45;
addto p103 also p46;
addto p103 also p50;
addto p103 also p51;
addto p103 also p55;
addto p103 also p56;
addto p103 also p60;
addto p103 also p64;
addto p103 also p65;
addto p103 also p66;
addto p103 also p67;
addto p103 also p68;
addto p103 also p69;
addto p103 also p70;
addto p103 also p71;
addto p103 also p72;
addto p103 also p73;
addto p103 also p74;
addto p103 also p75;
addto p103 also p76;
addto p103 also p77;
addto p103 also p78;
addto p103 also p79;
addto p103 also p80;
addto p103 also p81;
addto p103 also p82;
addto p103 also p83;
addto p103 also p84;
addto p103 also p85;
addto p103 also p86;
addto p103 also p87;
addto p103 also p88;
addto p103 also p89;
addto p103 also p90;
addto p103 also p91;
addto p103 also p92;
addto p103 also p93;
addto p103 also p94;
addto p103 also p95;
addto p103 also p96;
addto p103 also p97;
addto p103 also p98;
addto p103 also p102;
beginfig(0);
draw p1;
draw p2;
draw p4;
draw p7;
draw p9;
draw p12;
draw p14;
draw p17;
draw p19;
draw p22;
draw p24;
draw p27;
draw p29;
draw p33;
draw p36;
draw p38;
draw p41;
draw p43;
draw p46;
draw p48;
draw p51;
draw p53;
draw p56;
draw p58;
draw p62;
draw p65;
draw p66;
draw p67;
draw p68;
draw p69;
draw p70;
draw p71;
draw p72;
draw p73;
draw p74;
draw p75;
draw p76;
draw p77;
draw p78;
draw p79;
draw p80;
draw p81;
draw p82;
draw p83;
draw p84;
draw p85;
draw p86;
draw p87;
draw p88;
draw p89;
draw p90;
draw p91;
draw p92;
draw p93;
draw p94;
draw p95;
draw p96;
draw p97;
draw p98;
draw p100;
endfig;
end;
