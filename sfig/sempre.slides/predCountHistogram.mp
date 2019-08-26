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
h2 := ((38.09524,0)--(38.09524,-3));
p2 := image(draw h2);
p3 := image(draw btex 2 etex; hackTextBounds) scaled 2.5454545454545454;
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
p6 := (p6 xshifted 38.09524);
p6 := (p6 yshifted -3);
p5 := (p5 xscaled 0.7);
p5 := (p5 yscaled 0.7);
p5 := (p5 xshifted 38.09524);
p5 := (p5 yshifted -3);
p4 := (p4 xscaled 0.7);
p4 := (p4 yscaled 0.7);
p4 := (p4 xshifted 38.09524);
p4 := (p4 yshifted -3);
h3 := ((76.19048,0)--(76.19048,-3));
p7 := image(draw h3);
p8 := image(draw btex 3 etex; hackTextBounds) scaled 2.5454545454545454;
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
p11 := (p11 xshifted 76.19048);
p11 := (p11 yshifted -3);
p10 := (p10 xscaled 0.7);
p10 := (p10 yscaled 0.7);
p10 := (p10 xshifted 76.19048);
p10 := (p10 yshifted -3);
p9 := (p9 xscaled 0.7);
p9 := (p9 yscaled 0.7);
p9 := (p9 xshifted 76.19048);
p9 := (p9 yshifted -3);
h4 := ((114.28571,0)--(114.28571,-3));
p12 := image(draw h4);
p13 := image(draw btex 4 etex; hackTextBounds) scaled 2.5454545454545454;
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
p16 := (p16 xshifted 114.28571);
p16 := (p16 yshifted -3);
p15 := (p15 xscaled 0.7);
p15 := (p15 yscaled 0.7);
p15 := (p15 xshifted 114.28571);
p15 := (p15 yshifted -3);
p14 := (p14 xscaled 0.7);
p14 := (p14 yscaled 0.7);
p14 := (p14 xshifted 114.28571);
p14 := (p14 yshifted -3);
h5 := ((152.38095,0)--(152.38095,-3));
p17 := image(draw h5);
p18 := image(draw btex 5 etex; hackTextBounds) scaled 2.5454545454545454;
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
p21 := (p21 xshifted 152.38095);
p21 := (p21 yshifted -3);
p20 := (p20 xscaled 0.7);
p20 := (p20 yscaled 0.7);
p20 := (p20 xshifted 152.38095);
p20 := (p20 yshifted -3);
p19 := (p19 xscaled 0.7);
p19 := (p19 yscaled 0.7);
p19 := (p19 xshifted 152.38095);
p19 := (p19 yshifted -3);
h6 := ((190.47619,0)--(190.47619,-3));
p22 := image(draw h6);
p23 := image(draw btex 6 etex; hackTextBounds) scaled 2.5454545454545454;
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
p26 := (p26 xshifted 190.47619);
p26 := (p26 yshifted -3);
p25 := (p25 xscaled 0.7);
p25 := (p25 yscaled 0.7);
p25 := (p25 xshifted 190.47619);
p25 := (p25 yshifted -3);
p24 := (p24 xscaled 0.7);
p24 := (p24 yscaled 0.7);
p24 := (p24 xshifted 190.47619);
p24 := (p24 yshifted -3);
h7 := ((228.57143,0)--(228.57143,-3));
p27 := image(draw h7);
p28 := image(draw btex 7 etex; hackTextBounds) scaled 2.5454545454545454;
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
p31 := (p31 xshifted 228.57143);
p31 := (p31 yshifted -3);
p30 := (p30 xscaled 0.7);
p30 := (p30 yscaled 0.7);
p30 := (p30 xshifted 228.57143);
p30 := (p30 yshifted -3);
p29 := (p29 xscaled 0.7);
p29 := (p29 yscaled 0.7);
p29 := (p29 xshifted 228.57143);
p29 := (p29 yshifted -3);
h8 := ((266.66667,0)--(266.66667,-3));
p32 := image(draw h8);
p33 := image(draw btex 8 etex; hackTextBounds) scaled 2.5454545454545454;
p34 := (p33 yshifted (-H(p33)));
p35 := nullpicture;
addto p35 also p34;
n13 := ((L(p34)*-0.5)+((L(p34)+W(p34))*-0.5));
n14 := (T(p34)*-1);
p35 := (p35 xshifted n13);
p35 := (p35 yshifted n14);
p34 := (p34 xshifted n13);
p34 := (p34 yshifted n14);
p36 := nullpicture;
addto p36 also p35;
p36 := (p36 xscaled 0.7);
p36 := (p36 yscaled 0.7);
p36 := (p36 xshifted 266.66667);
p36 := (p36 yshifted -3);
p35 := (p35 xscaled 0.7);
p35 := (p35 yscaled 0.7);
p35 := (p35 xshifted 266.66667);
p35 := (p35 yshifted -3);
p34 := (p34 xscaled 0.7);
p34 := (p34 yscaled 0.7);
p34 := (p34 xshifted 266.66667);
p34 := (p34 yshifted -3);
h9 := ((304.7619,0)--(304.7619,-3));
p37 := image(draw h9);
p38 := image(draw btex 9 etex; hackTextBounds) scaled 2.5454545454545454;
p39 := (p38 yshifted (-H(p38)));
p40 := nullpicture;
addto p40 also p39;
n15 := ((L(p39)*-0.5)+((L(p39)+W(p39))*-0.5));
n16 := (T(p39)*-1);
p40 := (p40 xshifted n15);
p40 := (p40 yshifted n16);
p39 := (p39 xshifted n15);
p39 := (p39 yshifted n16);
p41 := nullpicture;
addto p41 also p40;
p41 := (p41 xscaled 0.7);
p41 := (p41 yscaled 0.7);
p41 := (p41 xshifted 304.7619);
p41 := (p41 yshifted -3);
p40 := (p40 xscaled 0.7);
p40 := (p40 yscaled 0.7);
p40 := (p40 xshifted 304.7619);
p40 := (p40 yshifted -3);
p39 := (p39 xscaled 0.7);
p39 := (p39 yscaled 0.7);
p39 := (p39 xshifted 304.7619);
p39 := (p39 yshifted -3);
h10 := ((342.85714,0)--(342.85714,-3));
p42 := image(draw h10);
p43 := image(draw btex 10 etex; hackTextBounds) scaled 2.5454545454545454;
p44 := (p43 yshifted (-H(p43)));
p45 := nullpicture;
addto p45 also p44;
n17 := ((L(p44)*-0.5)+((L(p44)+W(p44))*-0.5));
n18 := (T(p44)*-1);
p45 := (p45 xshifted n17);
p45 := (p45 yshifted n18);
p44 := (p44 xshifted n17);
p44 := (p44 yshifted n18);
p46 := nullpicture;
addto p46 also p45;
p46 := (p46 xscaled 0.7);
p46 := (p46 yscaled 0.7);
p46 := (p46 xshifted 342.85714);
p46 := (p46 yshifted -3);
p45 := (p45 xscaled 0.7);
p45 := (p45 yscaled 0.7);
p45 := (p45 xshifted 342.85714);
p45 := (p45 yshifted -3);
p44 := (p44 xscaled 0.7);
p44 := (p44 yscaled 0.7);
p44 := (p44 xshifted 342.85714);
p44 := (p44 yshifted -3);
h11 := ((380.95238,0)--(380.95238,-3));
p47 := image(draw h11);
p48 := image(draw btex 11 etex; hackTextBounds) scaled 2.5454545454545454;
p49 := (p48 yshifted (-H(p48)));
p50 := nullpicture;
addto p50 also p49;
n19 := ((L(p49)*-0.5)+((L(p49)+W(p49))*-0.5));
n20 := (T(p49)*-1);
p50 := (p50 xshifted n19);
p50 := (p50 yshifted n20);
p49 := (p49 xshifted n19);
p49 := (p49 yshifted n20);
p51 := nullpicture;
addto p51 also p50;
p51 := (p51 xscaled 0.7);
p51 := (p51 yscaled 0.7);
p51 := (p51 xshifted 380.95238);
p51 := (p51 yshifted -3);
p50 := (p50 xscaled 0.7);
p50 := (p50 yscaled 0.7);
p50 := (p50 xshifted 380.95238);
p50 := (p50 yshifted -3);
p49 := (p49 xscaled 0.7);
p49 := (p49 yscaled 0.7);
p49 := (p49 xshifted 380.95238);
p49 := (p49 yshifted -3);
p52 := image(draw btex formula size etex; hackTextBounds) scaled 2.5454545454545454;
p53 := (p52 yshifted (-H(p52)));
p54 := nullpicture;
addto p54 also p53;
n21 := ((L(p53)*-0.5)+((L(p53)+W(p53))*-0.5));
n22 := (T(p53)*-1);
p54 := (p54 xshifted n21);
p54 := (p54 yshifted n22);
p53 := (p53 xshifted n21);
p53 := (p53 yshifted n22);
p55 := nullpicture;
addto p55 also p54;
p55 := (p55 xshifted 200);
p55 := (p55 yshifted -15);
p54 := (p54 xshifted 200);
p54 := (p54 yshifted -15);
p53 := (p53 xshifted 200);
p53 := (p53 yshifted -15);
h12 := ((0,0)--(0,130));
p56 := image(draw h12);
p57 := image(draw btex 0 etex; hackTextBounds) scaled 2.5454545454545454;
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
p59 := (p59 xscaled 0.7);
p59 := (p59 yscaled 0.7);
p59 := (p59 xshifted -3);
p58 := (p58 xscaled 0.7);
p58 := (p58 yscaled 0.7);
p58 := (p58 xshifted -3);
h13 := ((0,24)--(400,24));
p61 := image(draw h13 withcolor (0.82745,0.82745,0.82745));
p62 := image(draw btex 500 etex; hackTextBounds) scaled 2.5454545454545454;
p63 := (p62 yshifted (-H(p62)));
p64 := nullpicture;
addto p64 also p63;
n25 := ((L(p63)+W(p63))*-1);
n26 := ((T(p63)*-0.5)+((T(p63)-H(p63))*-0.5));
p64 := (p64 xshifted n25);
p64 := (p64 yshifted n26);
p63 := (p63 xshifted n25);
p63 := (p63 yshifted n26);
p65 := nullpicture;
addto p65 also p64;
p65 := (p65 xscaled 0.7);
p65 := (p65 yscaled 0.7);
p65 := (p65 xshifted -3);
p65 := (p65 yshifted 24);
p64 := (p64 xscaled 0.7);
p64 := (p64 yscaled 0.7);
p64 := (p64 xshifted -3);
p64 := (p64 yshifted 24);
p63 := (p63 xscaled 0.7);
p63 := (p63 yscaled 0.7);
p63 := (p63 xshifted -3);
p63 := (p63 yshifted 24);
h14 := ((0,48)--(400,48));
p66 := image(draw h14 withcolor (0.82745,0.82745,0.82745));
p67 := image(draw btex 1000 etex; hackTextBounds) scaled 2.5454545454545454;
p68 := (p67 yshifted (-H(p67)));
p69 := nullpicture;
addto p69 also p68;
n27 := ((L(p68)+W(p68))*-1);
n28 := ((T(p68)*-0.5)+((T(p68)-H(p68))*-0.5));
p69 := (p69 xshifted n27);
p69 := (p69 yshifted n28);
p68 := (p68 xshifted n27);
p68 := (p68 yshifted n28);
p70 := nullpicture;
addto p70 also p69;
p70 := (p70 xscaled 0.7);
p70 := (p70 yscaled 0.7);
p70 := (p70 xshifted -3);
p70 := (p70 yshifted 48);
p69 := (p69 xscaled 0.7);
p69 := (p69 yscaled 0.7);
p69 := (p69 xshifted -3);
p69 := (p69 yshifted 48);
p68 := (p68 xscaled 0.7);
p68 := (p68 yscaled 0.7);
p68 := (p68 xshifted -3);
p68 := (p68 yshifted 48);
h15 := ((0,72)--(400,72));
p71 := image(draw h15 withcolor (0.82745,0.82745,0.82745));
p72 := image(draw btex 1500 etex; hackTextBounds) scaled 2.5454545454545454;
p73 := (p72 yshifted (-H(p72)));
p74 := nullpicture;
addto p74 also p73;
n29 := ((L(p73)+W(p73))*-1);
n30 := ((T(p73)*-0.5)+((T(p73)-H(p73))*-0.5));
p74 := (p74 xshifted n29);
p74 := (p74 yshifted n30);
p73 := (p73 xshifted n29);
p73 := (p73 yshifted n30);
p75 := nullpicture;
addto p75 also p74;
p75 := (p75 xscaled 0.7);
p75 := (p75 yscaled 0.7);
p75 := (p75 xshifted -3);
p75 := (p75 yshifted 72);
p74 := (p74 xscaled 0.7);
p74 := (p74 yscaled 0.7);
p74 := (p74 xshifted -3);
p74 := (p74 yshifted 72);
p73 := (p73 xscaled 0.7);
p73 := (p73 yscaled 0.7);
p73 := (p73 xshifted -3);
p73 := (p73 yshifted 72);
h16 := ((0,96)--(400,96));
p76 := image(draw h16 withcolor (0.82745,0.82745,0.82745));
p77 := image(draw btex 2000 etex; hackTextBounds) scaled 2.5454545454545454;
p78 := (p77 yshifted (-H(p77)));
p79 := nullpicture;
addto p79 also p78;
n31 := ((L(p78)+W(p78))*-1);
n32 := ((T(p78)*-0.5)+((T(p78)-H(p78))*-0.5));
p79 := (p79 xshifted n31);
p79 := (p79 yshifted n32);
p78 := (p78 xshifted n31);
p78 := (p78 yshifted n32);
p80 := nullpicture;
addto p80 also p79;
p80 := (p80 xscaled 0.7);
p80 := (p80 yscaled 0.7);
p80 := (p80 xshifted -3);
p80 := (p80 yshifted 96);
p79 := (p79 xscaled 0.7);
p79 := (p79 yscaled 0.7);
p79 := (p79 xshifted -3);
p79 := (p79 yshifted 96);
p78 := (p78 xscaled 0.7);
p78 := (p78 yscaled 0.7);
p78 := (p78 xshifted -3);
p78 := (p78 yshifted 96);
h17 := ((0,120)--(400,120));
p81 := image(draw h17 withcolor (0.82745,0.82745,0.82745));
p82 := image(draw btex 2500 etex; hackTextBounds) scaled 2.5454545454545454;
p83 := (p82 yshifted (-H(p82)));
p84 := nullpicture;
addto p84 also p83;
n33 := ((L(p83)+W(p83))*-1);
n34 := ((T(p83)*-0.5)+((T(p83)-H(p83))*-0.5));
p84 := (p84 xshifted n33);
p84 := (p84 yshifted n34);
p83 := (p83 xshifted n33);
p83 := (p83 yshifted n34);
p85 := nullpicture;
addto p85 also p84;
p85 := (p85 xscaled 0.7);
p85 := (p85 yscaled 0.7);
p85 := (p85 xshifted -3);
p85 := (p85 yshifted 120);
p84 := (p84 xscaled 0.7);
p84 := (p84 yscaled 0.7);
p84 := (p84 xshifted -3);
p84 := (p84 yshifted 120);
p83 := (p83 xscaled 0.7);
p83 := (p83 yscaled 0.7);
p83 := (p83 xshifted -3);
p83 := (p83 yshifted 120);
p86 := image(draw btex frequency etex; hackTextBounds) scaled 2.5454545454545454;
p87 := (p86 yshifted (-H(p86)));
p87 := (p87 rotated 90);
p88 := nullpicture;
addto p88 also p87;
n35 := ((L(p87)+W(p87))*-1);
n36 := ((T(p87)*-0.5)+((T(p87)-H(p87))*-0.5));
p88 := (p88 xshifted n35);
p88 := (p88 yshifted n36);
p87 := (p87 xshifted n35);
p87 := (p87 yshifted n36);
p89 := nullpicture;
addto p89 also p88;
p89 := (p89 xshifted -40);
p89 := (p89 yshifted 60);
p88 := (p88 xshifted -40);
p88 := (p88 yshifted 60);
p87 := (p87 xshifted -40);
p87 := (p87 yshifted 60);
h18 := ((23.09524,0)--(23.09524,17.088)--(53.09524,17.088)--(53.09524,0)--cycle);
p90 := nullpicture;
addto p90 also image(fill h18 withcolor (0.50196,0.50196,0.50196));
addto p90 also image(draw h18);
h19 := ((61.19048,0)--(61.19048,48.192)--(91.19048,48.192)--(91.19048,0)--cycle);
p91 := nullpicture;
addto p91 also image(fill h19 withcolor (0.50196,0.50196,0.50196));
addto p91 also image(draw h19);
h20 := ((99.28571,0)--(99.28571,102.432)--(129.28571,102.432)--(129.28571,0)--cycle);
p92 := nullpicture;
addto p92 also image(fill h20 withcolor (0.50196,0.50196,0.50196));
addto p92 also image(draw h20);
h21 := ((137.38095,0)--(137.38095,67.104)--(167.38095,67.104)--(167.38095,0)--cycle);
p93 := nullpicture;
addto p93 also image(fill h21 withcolor (0.50196,0.50196,0.50196));
addto p93 also image(draw h21);
h22 := ((175.47619,0)--(175.47619,75.504)--(205.47619,75.504)--(205.47619,0)--cycle);
p94 := nullpicture;
addto p94 also image(fill h22 withcolor (0.50196,0.50196,0.50196));
addto p94 also image(draw h22);
h23 := ((213.57143,0)--(213.57143,78.816)--(243.57143,78.816)--(243.57143,0)--cycle);
p95 := nullpicture;
addto p95 also image(fill h23 withcolor (0.50196,0.50196,0.50196));
addto p95 also image(draw h23);
h24 := ((251.66667,0)--(251.66667,82.56)--(281.66667,82.56)--(281.66667,0)--cycle);
p96 := nullpicture;
addto p96 also image(fill h24 withcolor (0.50196,0.50196,0.50196));
addto p96 also image(draw h24);
h25 := ((289.7619,0)--(289.7619,41.664)--(319.7619,41.664)--(319.7619,0)--cycle);
p97 := nullpicture;
addto p97 also image(fill h25 withcolor (0.50196,0.50196,0.50196));
addto p97 also image(draw h25);
h26 := ((327.85714,0)--(327.85714,5.616)--(357.85714,5.616)--(357.85714,0)--cycle);
p98 := nullpicture;
addto p98 also image(fill h26 withcolor (0.50196,0.50196,0.50196));
addto p98 also image(draw h26);
h27 := ((365.95238,0)--(365.95238,11.04)--(395.95238,11.04)--(395.95238,0)--cycle);
p99 := nullpicture;
addto p99 also image(fill h27 withcolor (0.50196,0.50196,0.50196));
addto p99 also image(draw h27);
p100 := nullpicture;
addto p100 also p1;
addto p100 also p2;
addto p100 also p6;
addto p100 also p7;
addto p100 also p11;
addto p100 also p12;
addto p100 also p16;
addto p100 also p17;
addto p100 also p21;
addto p100 also p22;
addto p100 also p26;
addto p100 also p27;
addto p100 also p31;
addto p100 also p32;
addto p100 also p36;
addto p100 also p37;
addto p100 also p41;
addto p100 also p42;
addto p100 also p46;
addto p100 also p47;
addto p100 also p51;
addto p100 also p55;
addto p100 also p56;
addto p100 also p60;
addto p100 also p61;
addto p100 also p65;
addto p100 also p66;
addto p100 also p70;
addto p100 also p71;
addto p100 also p75;
addto p100 also p76;
addto p100 also p80;
addto p100 also p81;
addto p100 also p85;
addto p100 also p89;
addto p100 also p90;
addto p100 also p91;
addto p100 also p92;
addto p100 also p93;
addto p100 also p94;
addto p100 also p95;
addto p100 also p96;
addto p100 also p97;
addto p100 also p98;
addto p100 also p99;
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
draw p32;
draw p34;
draw p37;
draw p39;
draw p42;
draw p44;
draw p47;
draw p49;
draw p53;
draw p56;
draw p58;
draw p61;
draw p63;
draw p66;
draw p68;
draw p71;
draw p73;
draw p76;
draw p78;
draw p81;
draw p83;
draw p87;
draw p90;
draw p91;
draw p92;
draw p93;
draw p94;
draw p95;
draw p96;
draw p97;
draw p98;
draw p99;
endfig;
end;
