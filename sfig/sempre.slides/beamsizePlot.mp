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
h1 := ((0,0)--(210,0));
p1 := image(draw h1);
h2 := ((0,0)--(0,-3));
p2 := image(draw h2);
p3 := image(draw btex 1 etex; hackTextBounds) scaled 2.5454545454545454;
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
h3 := ((50,0)--(50,-3));
p7 := image(draw h3);
p8 := image(draw btex 4 etex; hackTextBounds) scaled 2.5454545454545454;
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
p11 := (p11 xshifted 50);
p11 := (p11 yshifted -3);
p10 := (p10 xscaled 0.7);
p10 := (p10 yscaled 0.7);
p10 := (p10 xshifted 50);
p10 := (p10 yshifted -3);
p9 := (p9 xscaled 0.7);
p9 := (p9 yscaled 0.7);
p9 := (p9 xshifted 50);
p9 := (p9 yshifted -3);
h4 := ((100,0)--(100,-3));
p12 := image(draw h4);
p13 := image(draw btex 20 etex; hackTextBounds) scaled 2.5454545454545454;
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
p16 := (p16 xshifted 100);
p16 := (p16 yshifted -3);
p15 := (p15 xscaled 0.7);
p15 := (p15 yscaled 0.7);
p15 := (p15 xshifted 100);
p15 := (p15 yshifted -3);
p14 := (p14 xscaled 0.7);
p14 := (p14 yscaled 0.7);
p14 := (p14 xshifted 100);
p14 := (p14 yshifted -3);
h5 := ((150,0)--(150,-3));
p17 := image(draw h5);
p18 := image(draw btex 89 etex; hackTextBounds) scaled 2.5454545454545454;
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
p21 := (p21 xshifted 150);
p21 := (p21 yshifted -3);
p20 := (p20 xscaled 0.7);
p20 := (p20 yscaled 0.7);
p20 := (p20 xshifted 150);
p20 := (p20 yshifted -3);
p19 := (p19 xscaled 0.7);
p19 := (p19 yscaled 0.7);
p19 := (p19 xshifted 150);
p19 := (p19 yshifted -3);
h6 := ((200,0)--(200,-3));
p22 := image(draw h6);
p23 := image(draw btex 400 etex; hackTextBounds) scaled 2.5454545454545454;
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
p26 := (p26 xshifted 200);
p26 := (p26 yshifted -3);
p25 := (p25 xscaled 0.7);
p25 := (p25 yscaled 0.7);
p25 := (p25 xshifted 200);
p25 := (p25 yshifted -3);
p24 := (p24 xscaled 0.7);
p24 := (p24 yscaled 0.7);
p24 := (p24 xshifted 200);
p24 := (p24 yshifted -3);
p27 := image(draw btex beam size etex; hackTextBounds) scaled 2.5454545454545454;
p28 := (p27 yshifted (-H(p27)));
p29 := nullpicture;
addto p29 also p28;
n11 := ((L(p28)*-0.5)+((L(p28)+W(p28))*-0.5));
n12 := (T(p28)*-1);
p29 := (p29 xshifted n11);
p29 := (p29 yshifted n12);
p28 := (p28 xshifted n11);
p28 := (p28 yshifted n12);
p30 := nullpicture;
addto p30 also p29;
p30 := (p30 xshifted 100);
p30 := (p30 yshifted -20);
p29 := (p29 xshifted 100);
p29 := (p29 yshifted -20);
p28 := (p28 xshifted 100);
p28 := (p28 yshifted -20);
h7 := ((0,0)--(0,160));
p31 := image(draw h7);
p32 := image(draw btex 0 etex; hackTextBounds) scaled 2.5454545454545454;
p33 := (p32 yshifted (-H(p32)));
p34 := nullpicture;
addto p34 also p33;
n13 := ((L(p33)+W(p33))*-1);
n14 := ((T(p33)*-0.5)+((T(p33)-H(p33))*-0.5));
p34 := (p34 xshifted n13);
p34 := (p34 yshifted n14);
p33 := (p33 xshifted n13);
p33 := (p33 yshifted n14);
p35 := nullpicture;
addto p35 also p34;
p35 := (p35 xscaled 0.7);
p35 := (p35 yscaled 0.7);
p35 := (p35 xshifted -3);
p34 := (p34 xscaled 0.7);
p34 := (p34 yscaled 0.7);
p34 := (p34 xshifted -3);
p33 := (p33 xscaled 0.7);
p33 := (p33 yscaled 0.7);
p33 := (p33 xshifted -3);
h8 := ((0,18.75)--(200,18.75));
p36 := image(draw h8 withcolor (0.82745,0.82745,0.82745));
p37 := image(draw btex 10 etex; hackTextBounds) scaled 2.5454545454545454;
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
p40 := (p40 yshifted 18.75);
p39 := (p39 xscaled 0.7);
p39 := (p39 yscaled 0.7);
p39 := (p39 xshifted -3);
p39 := (p39 yshifted 18.75);
p38 := (p38 xscaled 0.7);
p38 := (p38 yscaled 0.7);
p38 := (p38 xshifted -3);
p38 := (p38 yshifted 18.75);
h9 := ((0,37.5)--(200,37.5));
p41 := image(draw h9 withcolor (0.82745,0.82745,0.82745));
p42 := image(draw btex 20 etex; hackTextBounds) scaled 2.5454545454545454;
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
h10 := ((0,56.25)--(200,56.25));
p46 := image(draw h10 withcolor (0.82745,0.82745,0.82745));
p47 := image(draw btex 30 etex; hackTextBounds) scaled 2.5454545454545454;
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
p50 := (p50 yshifted 56.25);
p49 := (p49 xscaled 0.7);
p49 := (p49 yscaled 0.7);
p49 := (p49 xshifted -3);
p49 := (p49 yshifted 56.25);
p48 := (p48 xscaled 0.7);
p48 := (p48 yscaled 0.7);
p48 := (p48 xshifted -3);
p48 := (p48 yshifted 56.25);
h11 := ((0,75)--(200,75));
p51 := image(draw h11 withcolor (0.82745,0.82745,0.82745));
p52 := image(draw btex 40 etex; hackTextBounds) scaled 2.5454545454545454;
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
p55 := (p55 yshifted 75);
p54 := (p54 xscaled 0.7);
p54 := (p54 yscaled 0.7);
p54 := (p54 xshifted -3);
p54 := (p54 yshifted 75);
p53 := (p53 xscaled 0.7);
p53 := (p53 yscaled 0.7);
p53 := (p53 xshifted -3);
p53 := (p53 yshifted 75);
h12 := ((0,93.75)--(200,93.75));
p56 := image(draw h12 withcolor (0.82745,0.82745,0.82745));
p57 := image(draw btex 50 etex; hackTextBounds) scaled 2.5454545454545454;
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
p60 := (p60 yshifted 93.75);
p59 := (p59 xscaled 0.7);
p59 := (p59 yscaled 0.7);
p59 := (p59 xshifted -3);
p59 := (p59 yshifted 93.75);
p58 := (p58 xscaled 0.7);
p58 := (p58 yscaled 0.7);
p58 := (p58 xshifted -3);
p58 := (p58 yshifted 93.75);
h13 := ((0,112.5)--(200,112.5));
p61 := image(draw h13 withcolor (0.82745,0.82745,0.82745));
p62 := image(draw btex 60 etex; hackTextBounds) scaled 2.5454545454545454;
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
p65 := (p65 yshifted 112.5);
p64 := (p64 xscaled 0.7);
p64 := (p64 yscaled 0.7);
p64 := (p64 xshifted -3);
p64 := (p64 yshifted 112.5);
p63 := (p63 xscaled 0.7);
p63 := (p63 yscaled 0.7);
p63 := (p63 xshifted -3);
p63 := (p63 yshifted 112.5);
h14 := ((0,131.25)--(200,131.25));
p66 := image(draw h14 withcolor (0.82745,0.82745,0.82745));
p67 := image(draw btex 70 etex; hackTextBounds) scaled 2.5454545454545454;
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
p70 := (p70 yshifted 131.25);
p69 := (p69 xscaled 0.7);
p69 := (p69 yscaled 0.7);
p69 := (p69 xshifted -3);
p69 := (p69 yshifted 131.25);
p68 := (p68 xscaled 0.7);
p68 := (p68 yscaled 0.7);
p68 := (p68 xshifted -3);
p68 := (p68 yshifted 131.25);
h15 := ((0,150)--(200,150));
p71 := image(draw h15 withcolor (0.82745,0.82745,0.82745));
p72 := image(draw btex 80 etex; hackTextBounds) scaled 2.5454545454545454;
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
p75 := (p75 yshifted 150);
p74 := (p74 xscaled 0.7);
p74 := (p74 yscaled 0.7);
p74 := (p74 xshifted -3);
p74 := (p74 yshifted 150);
p73 := (p73 xscaled 0.7);
p73 := (p73 yscaled 0.7);
p73 := (p73 xshifted -3);
p73 := (p73 yshifted 150);
p76 := image(draw btex score etex; hackTextBounds) scaled 2.5454545454545454;
p77 := (p76 yshifted (-H(p76)));
p77 := (p77 rotated 90);
p78 := nullpicture;
addto p78 also p77;
n31 := ((L(p77)+W(p77))*-1);
n32 := ((T(p77)*-0.5)+((T(p77)-H(p77))*-0.5));
p78 := (p78 xshifted n31);
p78 := (p78 yshifted n32);
p77 := (p77 xshifted n31);
p77 := (p77 yshifted n32);
p79 := nullpicture;
addto p79 also p78;
p79 := (p79 xshifted -20);
p79 := (p79 yshifted 75);
p78 := (p78 xshifted -20);
p78 := (p78 yshifted 75);
p77 := (p77 xshifted -20);
p77 := (p77 yshifted 75);
h16 := ((0,16.3125)--(53.72436,105.375));
p80 := image(draw h16 withcolor (0,0,1) withpen pencircle scaled 2);
h17 := ((53.72436,105.375)--(76.86218,127.875));
p81 := image(draw h17 withcolor (0,0,1) withpen pencircle scaled 2);
h18 := ((76.86218,127.875)--(90.39694,132.75));
p82 := image(draw h18 withcolor (0,0,1) withpen pencircle scaled 2);
h19 := ((90.39694,132.75)--(107.44871,138.375));
p83 := image(draw h19 withcolor (0,0,1) withpen pencircle scaled 2);
h20 := ((107.44871,138.375)--(130.58654,142.125));
p84 := image(draw h20 withcolor (0,0,1) withpen pencircle scaled 2);
h21 := ((130.58654,142.125)--(153.72436,144.375));
p85 := image(draw h21 withcolor (0,0,1) withpen pencircle scaled 2);
h22 := ((153.72436,144.375)--(176.86218,145.5));
p86 := image(draw h22 withcolor (0,0,1) withpen pencircle scaled 2);
h23 := ((176.86218,145.5)--(200,146.25));
p87 := image(draw h23 withcolor (0,0,1) withpen pencircle scaled 2);
h24 := ((0,11.25)--(53.72436,56.8125));
p88 := image(draw h24 withcolor (1,0,0) withpen pencircle scaled 2);
h25 := ((53.72436,56.8125)--(76.86218,63.9375));
p89 := image(draw h25 withcolor (1,0,0) withpen pencircle scaled 2);
h26 := ((76.86218,63.9375)--(90.39694,69.375));
p90 := image(draw h26 withcolor (1,0,0) withpen pencircle scaled 2);
h27 := ((90.39694,69.375)--(107.44871,68.0625));
p91 := image(draw h27 withcolor (1,0,0) withpen pencircle scaled 2);
h28 := ((107.44871,68.0625)--(130.58654,67.6875));
p92 := image(draw h28 withcolor (1,0,0) withpen pencircle scaled 2);
h29 := ((130.58654,67.6875)--(153.72436,67.125));
p93 := image(draw h29 withcolor (1,0,0) withpen pencircle scaled 2);
h30 := ((153.72436,67.125)--(176.86218,69.5625));
p94 := image(draw h30 withcolor (1,0,0) withpen pencircle scaled 2);
h31 := ((176.86218,69.5625)--(200,68.4375));
p95 := image(draw h31 withcolor (1,0,0) withpen pencircle scaled 2);
p96 := nullpicture;
addto p96 also p1;
addto p96 also p2;
addto p96 also p6;
addto p96 also p7;
addto p96 also p11;
addto p96 also p12;
addto p96 also p16;
addto p96 also p17;
addto p96 also p21;
addto p96 also p22;
addto p96 also p26;
addto p96 also p30;
addto p96 also p31;
addto p96 also p35;
addto p96 also p36;
addto p96 also p40;
addto p96 also p41;
addto p96 also p45;
addto p96 also p46;
addto p96 also p50;
addto p96 also p51;
addto p96 also p55;
addto p96 also p56;
addto p96 also p60;
addto p96 also p61;
addto p96 also p65;
addto p96 also p66;
addto p96 also p70;
addto p96 also p71;
addto p96 also p75;
addto p96 also p79;
addto p96 also p80;
addto p96 also p81;
addto p96 also p82;
addto p96 also p83;
addto p96 also p84;
addto p96 also p85;
addto p96 also p86;
addto p96 also p87;
addto p96 also p88;
addto p96 also p89;
addto p96 also p90;
addto p96 also p91;
addto p96 also p92;
addto p96 also p93;
addto p96 also p94;
addto p96 also p95;
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
draw p28;
draw p31;
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
draw p61;
draw p63;
draw p66;
draw p68;
draw p71;
draw p73;
draw p77;
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
endfig;
end;
