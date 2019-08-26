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
p1 := image(draw btex \textbf{Selected entities} etex; hackTextBounds) scaled 2.5454545454545454;
p2 := (p1 yshifted (-H(p1)));
p3 := image(draw btex \textit{Avalon Super Loop} etex; hackTextBounds) scaled 2.5454545454545454;
p4 := (p3 yshifted (-H(p3)));
p5 := image(draw btex \textit{Hilton Area} etex; hackTextBounds) scaled 2.5454545454545454;
p6 := (p5 yshifted (-H(p5)));
p7 := image(draw btex \textit{Avalon Loop} etex; hackTextBounds) scaled 2.5454545454545454;
p8 := (p7 yshifted (-H(p7)));
p9 := image(draw btex \textit{Wildlands Loop} etex; hackTextBounds) scaled 2.5454545454545454;
p10 := (p9 yshifted (-H(p9)));
p11 := image(draw btex \textit{Mckeldin Area} etex; hackTextBounds) scaled 2.5454545454545454;
p12 := (p11 yshifted (-H(p11)));
p13 := image(draw btex \textit{Greenbury Point} etex; hackTextBounds) scaled 2.5454545454545454;
p14 := (p13 yshifted (-H(p13)));
p15 := image(draw btex \textit{Governer Bridge Natural Area} etex; hackTextBounds) scaled 2.5454545454545454;
p16 := (p15 yshifted (-H(p15)));
n1 := 0;
n2 := 0;
n3 := 0;
n4 := 0;
n5 := 0;
n6 := 0;
n7 := 0;
n8 := 0;
n9 := 0;
n1 := max(n1,W(p2));
n2 := max(n2,H(p2));
n1 := max(n1,W(p4));
n3 := max(n3,H(p4));
n1 := max(n1,W(p6));
n4 := max(n4,H(p6));
n1 := max(n1,W(p8));
n5 := max(n5,H(p8));
n1 := max(n1,W(p10));
n6 := max(n6,H(p10));
n1 := max(n1,W(p12));
n7 := max(n7,H(p12));
n1 := max(n1,W(p14));
n8 := max(n8,H(p14));
n1 := max(n1,W(p16));
n9 := max(n9,H(p16));
n10 := 0;
n10 := (n10+n1);
n11 := 0;
n11 := (n11+n2);
n11 := (n11+n3);
n11 := (n11+n4);
n11 := (n11+n5);
n11 := (n11+n6);
n11 := (n11+n7);
n11 := (n11+n8);
n11 := (n11+n9);
n12 := n1;
n13 := (0-n2);
n14 := (n13-n3);
n15 := (n14-n4);
n16 := (n15-n5);
n17 := (n16-n6);
n18 := (n17-n7);
n19 := (n18-n8);
n20 := (n19-n9);
n21 := n10;
n22 := (-n11);
n23 := 0;
n24 := 0;
p17 := nullpicture;
n21 := min(n21,0);
n22 := max(n22,0);
n23 := max(n23,n12);
n24 := min(n24,n13);
p2 := ((p2 xshifted ((n1*0.5)-(L(p2)+(W(p2)*0.5)))) yshifted ((0-(n2*0.5))-(T(p2)-(H(p2)*0.5))));
p2 := ((p2 xshifted ((n1*0.5)-(L(p2)+(W(p2)*0.5)))) yshifted ((0-(n2*0.5))-(T(p2)-(H(p2)*0.5))));
addto p17 also p2;
n21 := min(n21,0);
n22 := max(n22,n13);
n23 := max(n23,n12);
n24 := min(n24,n14);
p4 := ((p4 xshifted ((n1*0.5)-(L(p4)+(W(p4)*0.5)))) yshifted ((n13-(n3*0.5))-(T(p4)-(H(p4)*0.5))));
p4 := ((p4 xshifted ((n1*0.5)-(L(p4)+(W(p4)*0.5)))) yshifted ((n13-(n3*0.5))-(T(p4)-(H(p4)*0.5))));
addto p17 also p4;
n21 := min(n21,0);
n22 := max(n22,n14);
n23 := max(n23,n12);
n24 := min(n24,n15);
p6 := ((p6 xshifted ((n1*0.5)-(L(p6)+(W(p6)*0.5)))) yshifted ((n14-(n4*0.5))-(T(p6)-(H(p6)*0.5))));
p6 := ((p6 xshifted ((n1*0.5)-(L(p6)+(W(p6)*0.5)))) yshifted ((n14-(n4*0.5))-(T(p6)-(H(p6)*0.5))));
addto p17 also p6;
n21 := min(n21,0);
n22 := max(n22,n15);
n23 := max(n23,n12);
n24 := min(n24,n16);
p8 := ((p8 xshifted ((n1*0.5)-(L(p8)+(W(p8)*0.5)))) yshifted ((n15-(n5*0.5))-(T(p8)-(H(p8)*0.5))));
p8 := ((p8 xshifted ((n1*0.5)-(L(p8)+(W(p8)*0.5)))) yshifted ((n15-(n5*0.5))-(T(p8)-(H(p8)*0.5))));
addto p17 also p8;
n21 := min(n21,0);
n22 := max(n22,n16);
n23 := max(n23,n12);
n24 := min(n24,n17);
p10 := ((p10 xshifted ((n1*0.5)-(L(p10)+(W(p10)*0.5)))) yshifted ((n16-(n6*0.5))-(T(p10)-(H(p10)*0.5))));
p10 := ((p10 xshifted ((n1*0.5)-(L(p10)+(W(p10)*0.5)))) yshifted ((n16-(n6*0.5))-(T(p10)-(H(p10)*0.5))));
addto p17 also p10;
n21 := min(n21,0);
n22 := max(n22,n17);
n23 := max(n23,n12);
n24 := min(n24,n18);
p12 := ((p12 xshifted ((n1*0.5)-(L(p12)+(W(p12)*0.5)))) yshifted ((n17-(n7*0.5))-(T(p12)-(H(p12)*0.5))));
p12 := ((p12 xshifted ((n1*0.5)-(L(p12)+(W(p12)*0.5)))) yshifted ((n17-(n7*0.5))-(T(p12)-(H(p12)*0.5))));
addto p17 also p12;
n21 := min(n21,0);
n22 := max(n22,n18);
n23 := max(n23,n12);
n24 := min(n24,n19);
p14 := ((p14 xshifted ((n1*0.5)-(L(p14)+(W(p14)*0.5)))) yshifted ((n18-(n8*0.5))-(T(p14)-(H(p14)*0.5))));
p14 := ((p14 xshifted ((n1*0.5)-(L(p14)+(W(p14)*0.5)))) yshifted ((n18-(n8*0.5))-(T(p14)-(H(p14)*0.5))));
addto p17 also p14;
n21 := min(n21,0);
n22 := max(n22,n19);
n23 := max(n23,n12);
n24 := min(n24,n20);
p16 := ((p16 xshifted ((n1*0.5)-(L(p16)+(W(p16)*0.5)))) yshifted ((n19-(n9*0.5))-(T(p16)-(H(p16)*0.5))));
p16 := ((p16 xshifted ((n1*0.5)-(L(p16)+(W(p16)*0.5)))) yshifted ((n19-(n9*0.5))-(T(p16)-(H(p16)*0.5))));
addto p17 also p16;
setbounds p17 to ((n21,n22)--(n21,n24)--(n23,n24)--(n23,n22)--cycle);
p18 := nullpicture;
h1 := ((0,0)--(0,(-((H(p17)+21)+(H(p18)/2))))--(max((W(p17)+21),(W(p18)+20)),(-((H(p17)+21)+(H(p18)/2))))--(max((W(p17)+21),(W(p18)+20)),0)--cycle);
p19 := nullpicture;
addto p19 also image(fill h1 withcolor (1,1,1));
addto p19 also image(draw h1);
p20 := nullpicture;
addto p20 also p19;
p21 := nullpicture;
addto p21 also p20;
p22 := nullpicture;
addto p22 also p18;
n25 := (L(p18)*-1);
n26 := ((T(p18)*-0.5)+((T(p18)-H(p18))*-0.5));
p22 := (p22 xshifted n25);
p22 := (p22 yshifted n26);
p18 := (p18 xshifted n25);
p18 := (p18 yshifted n26);
p23 := nullpicture;
addto p23 also p22;
p23 := (p23 xshifted 10);
p22 := (p22 xshifted 10);
p18 := (p18 xshifted 10);
p24 := nullpicture;
addto p24 also p23;
p25 := nullpicture;
addto p25 also p24;
p26 := nullpicture;
addto p26 also p21;
addto p26 also p25;
p27 := nullpicture;
addto p27 also p26;
n27 := ((L(p26)*-0.5)+((L(p26)+W(p26))*-0.5));
n28 := ((T(p26)*-0.5)+((T(p26)-H(p26))*-0.5));
p27 := (p27 xshifted n27);
p27 := (p27 yshifted n28);
p26 := (p26 xshifted n27);
p26 := (p26 yshifted n28);
p21 := (p21 xshifted n27);
p21 := (p21 yshifted n28);
p20 := (p20 xshifted n27);
p20 := (p20 yshifted n28);
p19 := (p19 xshifted n27);
p19 := (p19 yshifted n28);
p25 := (p25 xshifted n27);
p25 := (p25 yshifted n28);
p24 := (p24 xshifted n27);
p24 := (p24 yshifted n28);
p23 := (p23 xshifted n27);
p23 := (p23 yshifted n28);
p22 := (p22 xshifted n27);
p22 := (p22 yshifted n28);
p18 := (p18 xshifted n27);
p18 := (p18 yshifted n28);
p28 := nullpicture;
addto p28 also p27;
p29 := nullpicture;
addto p29 also p28;
p30 := nullpicture;
addto p30 also p29;
p31 := nullpicture;
addto p31 also p17;
n29 := ((L(p17)*-0.5)+((L(p17)+W(p17))*-0.5));
n30 := ((T(p17)*-0.5)+((T(p17)-H(p17))*-0.5));
p31 := (p31 xshifted n29);
p31 := (p31 yshifted n30);
p17 := (p17 xshifted n29);
p17 := (p17 yshifted n30);
p2 := (p2 xshifted n29);
p2 := (p2 yshifted n30);
p4 := (p4 xshifted n29);
p4 := (p4 yshifted n30);
p6 := (p6 xshifted n29);
p6 := (p6 yshifted n30);
p8 := (p8 xshifted n29);
p8 := (p8 yshifted n30);
p10 := (p10 xshifted n29);
p10 := (p10 yshifted n30);
p12 := (p12 xshifted n29);
p12 := (p12 yshifted n30);
p14 := (p14 xshifted n29);
p14 := (p14 yshifted n30);
p16 := (p16 xshifted n29);
p16 := (p16 yshifted n30);
p32 := nullpicture;
addto p32 also p31;
n31 := ((H(p18)/2)*-1);
p32 := (p32 yshifted n31);
p31 := (p31 yshifted n31);
p17 := (p17 yshifted n31);
p2 := (p2 yshifted n31);
p4 := (p4 yshifted n31);
p6 := (p6 yshifted n31);
p8 := (p8 yshifted n31);
p10 := (p10 yshifted n31);
p12 := (p12 yshifted n31);
p14 := (p14 yshifted n31);
p16 := (p16 yshifted n31);
p33 := nullpicture;
addto p33 also p32;
p34 := nullpicture;
addto p34 also p33;
p35 := nullpicture;
addto p35 also p30;
addto p35 also p34;
p36 := nullpicture;
addto p36 also p35;
beginfig(0);
draw p19;
draw p18;
draw p2;
draw p4;
draw p6;
draw p8;
draw p10;
draw p12;
draw p14;
draw p16;
endfig;
end;
