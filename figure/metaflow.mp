%%
%% This is file `metaflow.mp',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% metaflow.dtx  (with options: `package')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2011 by Kevin W. Hamlen
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3a of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX version
%% 2004/10/01 or later.
%% 
if unknown mpversion: errmessage
  "MetaPost v1.004 or later required (found one older than v0.900)";
elseif scantokens(mpversion) < 1.004: errmessage
  "MetaPost v1.004 or later required (found v" & mpversion & ")";
fi
def init_metaflow =
  save ip, il, cp, layer;
  path ip[], cp[];
  picture il[], layer[];
  thislayer := 0;
  layerlist := origin;
  itemlabels := nullpicture;
enddef;
extra_beginfig := extra_beginfig & "init_metaflow;";
extra_endfig := extra_endfig & "flatten;";
newinternal rradius;
rradius := 5;
newinternal pradius;
pradius := 3;
newinternal cmargin;
cmargin := 1.5ahlength;
newinternal ilmargin;
ilmargin := 3;
newinternal drumlidratio;
drumlidratio := .2;
newinternal rhombangle;
rhombangle := 80;
newinternal braceheight, clawwidth, beekheight;
newinternal braceret, beekangle, bracethick;
braceheight := 10;
clawwidth := 12;
beekheight := 4.5;
braceret := 1;
beekangle := 10;
bracethick := 1.5;
path layerlist;
newinternal thislayer;
picture itemlabels;
boolean itemfinal;
vardef gensuf(expr s) =
  save n,r,c; string r,c;
  n := 0; r := "";
  forever: exitunless n < length s;
    c := substring(n,n+1) of s;
    if (c>="0") and (c<="9"):
      r := r & "[]";
      forever: n := n + 1;
        c := substring(n,n+1) of s;
        exitunless (c=".") or ((c>="0") and (c<="9"));
      endfor
    elseif c="[":
      if (substring(n+1,n+2) of s)="[":
        r := r & "[["; n := n + 2;
      else:
        r := r & "[]"; n := n + 1;
        forever: exitunless n < length s;
          n := n + 1;
          exitif (substring(n-1,n) of s)="]";
        endfor
      fi
    else:
      r := r & c; n := n + 1;
    fi
  endfor
  r
enddef;
vardef inititem@#(text _t) =
  if (str @#)="":
    errmessage("unnamed shape");
  fi;
  if known ip@#:
    errmessage("redundant shape name: " & (str @#));
  fi;
  z@#bb.c = z@#c;
  z@#bb.ur = z@#c + .5z@#s;
  z@#bb.ll = z@#c - .5z@#s;
  z@#bb.ul = (x@#bb.ll, y@#bb.ur);
  z@#bb.lr = (x@#bb.ur, y@#bb.ll);
  z@#bb.um = .5[z@#bb.ul,z@#bb.ur];
  z@#bb.lm = .5[z@#bb.ll,z@#bb.lr];
  z@#bb.ml = .5[z@#bb.ll,z@#bb.ul];
  z@#bb.mr = .5[z@#bb.lr,z@#bb.ur];
  save _pic, _fin; picture _pic; boolean _fin;
  _fin := true;
  for __t=_t:
    if picture __t:
      _pic = __t;
    elseif string __t:
      _pic = __t infont defaultfont scaled defaultscale;
    elseif boolean __t:
      _fin := __t;
    else:
      errmessage("illegal shape argument type");
    fi
  endfor;
  itemfinal := _fin;
  if known _pic:
    z@#ls = urcorner _pic - llcorner _pic;
    if not picture il@#:
      scantokens ("picture il." & gensuf(str @#));
    fi
    il@# = _pic;
  fi
enddef;
vardef finitem@#(text p) =
  if itemfinal:
    if unknown x@#s: (x@#s,0) = (x@#ds,0) fi;
    if unknown y@#s: (0,y@#s) = (0,y@#ds) fi;
    if known il@#:
      addto itemlabels also
        (il@# shifted (z@#lc-.5[llcorner il@#,urcorner il@#]));
    fi
    if (path ip@#) and (unknown ip@#): ip@#=p; ip@# else: p fi
  fi
enddef;
vardef rect@#(text cap) =
  inititem@#(cap);
  z@#lr = z@#bb.lr;
  z@#ur = z@#bb.ur;
  z@#ul = z@#bb.ul;
  z@#ll = z@#bb.ll;
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#lc = z@#c;
  z@#ds = z@#ls + (2ilmargin,2ilmargin);
  finitem@#(z@#ll--z@#lr--z@#ur--z@#ul--cycle)
enddef;
vardef rrect@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#ll-z@#bb.ll = z@#bb.ur-z@#ur = rradius*(1-sqrt(.5))*(1,1);
  z@#lr-z@#bb.lr = z@#bb.ul-z@#ul = rradius*(1-sqrt(.5))*(-1,1);
  z@#lc = z@#c;
  z@#ds = z@#ls + 2*(if (rradius-ilmargin)*sqrt(2) > rradius-1:
                       (rradius-(rradius+1)/sqrt(2))*(1,1)
                     else: (ilmargin,ilmargin) fi);
  finitem@#(
    (subpath (0,2) of fullcircle scaled 2rradius
                        shifted (z@#bb.ur-(rradius,rradius)))--
    (subpath (2,4) of fullcircle scaled 2rradius
                        shifted (z@#bb.ul+(rradius,-rradius)))--
    (subpath (4,6) of fullcircle scaled 2rradius
                        shifted (z@#bb.ll+(rradius,rradius)))--
    (subpath (6,8) of fullcircle scaled 2rradius
                        shifted (z@#bb.lr-(rradius,-rradius)))--
    cycle
  )
enddef;
vardef _rax(expr y) =
  save ?; numeric ?;
  (?,y) = whatever * dir rhombangle;
  ?
enddef;
vardef rhomb@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = .5[z@#lr,z@#ur];
  z@#um = z@#bb.um;
  z@#ml = .5[z@#ll,z@#ul];
  z@#bb.ur-z@#ur = z@#ll-z@#bb.ll = (whatever,0);
  z@#bb.ul-z@#ul = z@#lr-z@#bb.lr = (whatever,0);
  z@#lc = z@#c;
  z@#ul-z@#ll = whatever * dir rhombangle;
  if rhombangle<90: z@#ll = z@#bb.ll
    else: z@#ul = z@#bb.ul fi;
  if known y@#ls:
    z@#ds = z@#ls + 2*(abs(_rax(y@#ls+2ilmargin)) +
                         max(ilmargin-abs(_rax(ilmargin)),0),
                       ilmargin);
  fi
  finitem@#(z@#ll--z@#lr--z@#ur--z@#ul--cycle)
enddef;
vardef trap@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = .5[z@#lr,z@#ur];
  z@#um = z@#bb.um;
  z@#ml = .5[z@#ll,z@#ul];
  z@#ul-z@#bb.ul = z@#bb.ur-z@#ur = (whatever,0);
  z@#ll-z@#bb.ll = z@#bb.lr-z@#lr = (whatever,0);
  z@#lc = z@#c;
  z@#ul-z@#ll = whatever * dir rhombangle;
  if rhombangle<90: z@#ll = z@#bb.ll
    else: z@#ul = z@#bb.ul fi;
  if known y@#ls:
    z@#ds = z@#ls + 2*(abs(_rax(y@#ls+2ilmargin)) +
                         max(ilmargin-abs(_rax(ilmargin)),0),
                       ilmargin);
  fi
  finitem@#(z@#ll--z@#lr--z@#ur--z@#ul--cycle)
enddef;
vardef diamond@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#ll = .5[z@#bb.lm,z@#bb.ml];
  z@#lr = .5[z@#bb.lm,z@#bb.mr];
  z@#ur = .5[z@#bb.um,z@#bb.mr];
  z@#ul = .5[z@#bb.um,z@#bb.ml];
  z@#lc = z@#c;
  if known z@#ls: z@#ds = begingroup
    save xt, yt; numeric xt, yt;
    (xt,yt) = .5z@#ls + if x@#ls>y@#ls: (0,ilmargin)
                        else: (ilmargin,0) fi;
    2*((xt,yt) + sqrt(xt*yt)*(1,1))
  endgroup; fi
  finitem@#(z@#lm--z@#mr--z@#um--z@#ml--cycle)
enddef;
vardef oval@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#ll-z@#bb.ll = z@#bb.ur-z@#ur = .5*(1-sqrt(.5))*z@#s;
  z@#lr-z@#bb.lr = z@#bb.ul-z@#ul = .5*(1-sqrt(.5))*(-x@#s,y@#s);
  z@#lc = z@#c;
  if known z@#ls: z@#ds = begingroup
    save xt,yt; numeric xt,yt;
    (xt,yt) = .5z@#ls + if x@#ls>y@#ls: (0,ilmargin)
                        else: (ilmargin,0) fi;
    2*sqrt(xt+yt)*(sqrt(xt),sqrt(yt))
  endgroup; fi
  finitem@#(fullcircle xscaled x@#s yscaled y@#s shifted z@#c)
enddef;
vardef circ@#(text cap) =
  inititem@#(cap);
  (x@#s,0) = (y@#s,0);
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#ll-z@#bb.ll = z@#bb.ur-z@#ur = .5*(1-sqrt(.5))*z@#s;
  z@#lr-z@#bb.lr = z@#bb.ul-z@#ul = .5*(1-sqrt(.5))*(-x@#s,y@#s);
  z@#lc = z@#c;
  if known z@#ls:
    z@#ds = length(z@#ls + if x@#ls>y@#ls: (2ilmargin,0)
                           else: (0,2ilmargin) fi) * (1,1);
  fi
  finitem@#(fullcircle scaled x@#s shifted z@#c)
enddef;
vardef drum@#(text cap) =
  inititem@#(cap);
  z@#lm = z@#bb.lm;
  z@#mr = z@#bb.mr;
  z@#um = z@#bb.um;
  z@#ml = z@#bb.ml;
  z@#ll-z@#bb.ll = z@#lr-z@#bb.lr = z@#bb.ur-z@#ur =
    z@#bb.ul-z@#ul = 1.5*(z@#c-z@#lc) = (0,.5drumlidratio*x@#s);
  z@#ds = z@#ls + (2ilmargin, 2ilmargin + 1.5drumlidratio*x@#ls);
  finitem@#(
    z@#ul--(halfcircle xscaled -x@#s yscaled (-drumlidratio*x@#s)
                       shifted .5[z@#ll,z@#lr])--
           (fullcircle xscaled x@#s yscaled (drumlidratio*x@#s)
                       shifted .5[z@#ul,z@#ur])
  )
enddef;
vardef tornbox@#(text cap) =
  inititem@#(cap);
  interim truecorners := 1;
  save p,b; path p; numeric b;
  p = origin{dir -25}..{right}(1,0);
  b = ypart (llcorner p);
  z@#ul = z@#bb.ul;
  z@#ur = z@#bb.ur;
  z@#ll = z@#bb.ll - x@#s*(0,b);
  z@#lr = (x@#bb.lr,y@#ll);
  z@#ml = .5[z@#ll,z@#ul];
  z@#mr = .5[z@#lr,z@#ur];
  z@#um = .5[z@#ul,z@#ur];
  z@#lm = z@#ll + x@#s*(p intersectionpoint ((.5,0)--(.5,b)));
  z@#lc = .5[z@#ml,z@#mr];
  z@#ds = z@#ls + (2ilmargin,2ilmargin-x@#ls*b);
  finitem@#(z@#ll{dir -25}..{right}z@#lr--z@#ur--z@#ul--cycle)
enddef;
def drawopen expr p = enddef;
vardef brace@#(expr o) =
  save t,u,v,w,bh,ew,ret,h,p;
  numeric t,w,bh,ew,ret,h;
  pair u,v;
  path p;
  z@#d = t[z@#a,z@#b];
  u = unitvector (z@#b-z@#a);
  v = u rotated (if ypart(o rotated -angle u)>0: 90 else: -90 fi);
  z@#c = z@#d + h*v;
  if unknown t: t=.5; fi
  if unknown h: h=braceheight; fi
  if h<0: v:=-v; h:=-h; fi
  w = min(length(z@#d-z@#a),length(z@#b-z@#d));
  bh = min(beekheight, h/2);
  ew = min(clawwidth, w/2);
  ret = braceret/(2clawwidth)*max(0,min(2clawwidth,w-2clawwidth));
  p = ( % top-left
        z@#c{-v rotated -beekangle/2} ..
        {-u}(z@#c -ew*u -(bh+ret/2-bracethick/2)*v){-u} ..
        {-u}(z@#a +ew*u +(h-bh+ret/2+bracethick/2)*v){-u} ..
        {-v}z@#a) &
      ( % bottom-left
        z@#a{v rotated -beekangle/2} ..
        {u}(z@#a +ew*u +(h-bh+ret/2-bracethick/2)*v){u} ..
        {u}(z@#c -ew*u -(bh+ret/2+bracethick/2)*v){u} ..
        {v}(z@#c -.5bracethick*v)) &
      ( % bottom-right
        (z@#c -.5bracethick*v){-v} ..
        {u}(z@#c +ew*u -(bh+ret/2+bracethick/2)*v){u} ..
        {u}(z@#b -ew*u +(h-bh+ret/2-bracethick/2)*v){u} ..
        {-v rotated beekangle/2}z@#b) &
      ( % top-right
        z@#b{v} ..
        {-u}(z@#b -ew*u +(h-bh+ret/2+bracethick/2)*v){-u} ..
        {-u}(z@#c +ew*u -(bh+ret/2-bracethick/2)*v){-u} ..
        {v rotated beekangle/2}z@#c) & cycle;
  if (path ip@#) and (unknown ip@#): ip@#=p; ip@# else: p fi
enddef;
def inback text t =
  begingroup
    save pic_, ils_;
    picture pic_,ils_;
    pic_ = currentpicture;
    ils_ = itemlabels;
    currentpicture := nullpicture;
    itemlabels := nullpicture;
    t;
    addto currentpicture also itemlabels;
    addto currentpicture also pic_;
    itemlabels := ils_;
  endgroup
enddef;
vardef turntolayer(expr n) =
  save t; numeric t;
  addto currentpicture also itemlabels;
  itemlabels := nullpicture;
  layer[thislayer] := currentpicture;
  thislayer := n;
  currentpicture := if known layer[n]: layer[n] else: nullpicture fi;
  layer[n] := nullpicture;
  t = xpart (layerlist intersectiontimes (n,n));
  if t=-1:
    layerlist := if ((n,n)<point 0 of layerlist): (n,n)..layerlist
                 else: layerlist..(n,n) fi;
  elseif t>floor t:
    t := floor t;
    layerlist := (subpath (0,t) of layerlist)..(n,n)..
                 (subpath (t+1,length layerlist) of layerlist);
  fi
enddef;
def flatten =
  addto currentpicture also itemlabels;
  if length layerlist>0:
    layer[thislayer] := currentpicture;
    currentpicture := nullpicture;
    for t=0 upto length layerlist:
      addto currentpicture also layer[xpart point t of layerlist];
    endfor
    picture layer[];
    thislayer := 0;
    layerlist := origin;
  fi
enddef;
def anchor(suffix $)(expr d) =
  (if (xpart d)=0:
     if (ypart d)=0: $c elseif (ypart d)>0: $um else: $lm fi
   elseif (xpart d)>0:
     if (ypart d)=0: $mr elseif (ypart d)>0: $ur else: $lr fi
   elseif (ypart d)=0: $ml elseif (ypart d)>0: $ul else: $ll fi)
enddef;
pair upright, downright, upleft, downleft;
upright = -downleft = unitvector (up+right);
downright = -upleft = unitvector (down+right);
vardef putitem[] expr d of i =
  anchor(z@bb,-d) = (if pair i: i else: anchor(z[i]bb,d) fi) + d
enddef;
def putitems(suffix $,$$) text t = t($,$$) enddef;
vardef like(suffix $,$$,#,##) =
  save d; pair d;
  d = if known (z$$c-z$c): z$$c-z$c else: z##c-z#c fi;
  anchor(z##,-d) - anchor(z#,d) = anchor(z$$,-d) - anchor(z$,d);
enddef;
vardef _corners(text #,##,op)(expr u)(text t) =
  interim truecorners := 1;
  save ux_,uy_,v_; numeric ux_,uy_; pair v_;
  (ux_,uy_) = if pair u: u else: op u fi;
  for uu = t:
    v_ := if pair uu: uu else: op uu fi;
    if (xpart v_)#ux_: ux_:=xpart v_; fi
    if (ypart v_)##uy_: uy_:=ypart v_; fi
  endfor
  (ux_,uy_)
enddef;
def urcorners = _corners(>)(>)(urcorner) enddef;
def ulcorners = _corners(<)(>)(ulcorner) enddef;
def llcorners = _corners(<)(<)(llcorner) enddef;
def lrcorners = _corners(>)(<)(lrcorner) enddef;
tertiarydef p filledwith f =
  begingroup
    save c; path c;
    c = (if picture p:
           begingroup interim truecorners := 1;
             bbox p
           endgroup
         elseif cycle p: p
         else:
           for t=1 upto length p:
             if point t of p = point 0 of p:
               (subpath (0,t) of p) & cycle
             elseif t = length p: p..cycle fi
             exitif point t of p = point 0 of p;
           endfor
         fi);
    if color f:
      fill c withcolor f;
    elseif picture f:
      save pic;
      picture pic;
      pic = f;
      clip pic to c;
      draw pic;
    else:
      errmessage("non-color/picture argument to filledwith ignored");
    fi;
    p
  endgroup
enddef;
tertiarydef b tesselatedwith p =
  begingroup
    save tpic, pic, llx, lly, urx, ury, psizx, psizy;
    picture tpic, pic;
    tpic := nullpicture;
    pic = p;
    (psizx,psizy) = (urcorner pic) - (llcorner pic);
    (llx,lly) = (llcorner pic) + ((llcorner b) - (llcorner pic));
    llx := llx div psizx * psizx;
    lly := lly div psizy * psizy;
    (urx,ury) = (urcorner b) + (psizx,psizy);
    for i = llx step psizx until urx:
      for j = lly step psizy until ury:
        addto tpic also (pic shifted (i,j));
      endfor;
    endfor;
    b filledwith tpic
  endgroup
enddef;
tertiarydef b stripedwith p =
  begingroup
    save tpic, pic, pl, e, d, s, r, dl, fp, ll, ur, x, gr;
    picture tpic, pic;
    numeric pl, dl, r, gr;
    pair s, ll, ur;
    path d, fp;
    tpic := nullpicture;
    pic = p;
    pl = length ((urcorner pic)-(llcorner pic));
    for e within pic:
      if stroked e:
        d := pathpart e;
        if ((point 0 of d) <> (point infinity of d)):
          gr = angle ((point infinity of d)-(point 0 of d));
        elseif (point 0 of (pathpart pic)) <> (point 0 of d):
          gr = angle ((point 0 of d)-(point 0 of (pathpart pic)));
        fi;
      fi;
      exitif known gr;
    endfor;
    if (known gr) and (pl>0):
      for e within pic:
        if stroked e:
          d := pathpart e;
          s := point 0 of d;
          dl := length ((point infinity of d)-s);
          r := if dl>0: angle ((point infinity of d)-s) else: gr fi;
          fp := b shifted -s rotated -r;
          ll := llcorner fp;
          ur := urcorner fp;
          for x = ((xpart ll) div pl*pl) step pl until (xpart ur)+pl:
            if dl>0:
              addto tpic contour ((x,ypart ll)--(x+dl,ypart ll)--
                                  (x+dl,ypart ur)--(x,ypart ur)--cycle)
                           rotated r shifted s withcolor (colorpart e);
            else:
              addto tpic doublepath ((x,ypart ll)--(x,ypart ur))
                           rotated r shifted s
                         withpen (penpart e) withcolor (colorpart e);
            fi;
          endfor;
        fi;
      endfor;
    fi;
    b filledwith tpic
  endgroup
enddef;
vardef dashstripes primary p =
  save pic, ur;
  picture pic; pic = p;
  pair ur; ur = urcorner pic;
  setbounds pic to
    (ulcorner pic)--(max(xpart ur,ypart ur), ypart ur)--cycle;
  pic
enddef;
picture evenstripes, pinstripes;
evenstripes = dashstripes evenly shifted -(ulcorner evenly)
                                 rotated 90;
pinstripes = dashstripes dashpattern(on 0 off 5 on 0 off 5)
             shifted -(0,10) rotated 90;
primarydef p colored c =
  begingroup
    save pic;
    picture pic;
    pic := nullpicture;
    addto pic also p withcolor c;
    pic
  endgroup
enddef;
def onhue(expr c) secondary d =
  _onhue_
  begingroup save pic;
  picture pic; pic=nullpicture;
  addto pic doublepath (0,d)..(d,d) withcolor c;
  pic
  endgroup
enddef;
tertiarydef p _onhue_ d =
  begingroup save pic, ur, delta;
  picture pic; pic=p;
  pair ur; ur=urcorner d;
  numeric delta; delta=max(xpart ur,ypart ur);
  addto pic also d shifted ((w,w)-(llcorner d));
  w := w+delta;
  pic shifted (0,delta)
  endgroup
enddef;
vardef connector@#(suffix $,$$)(expr dsrc,ddst) =
  if (str @#)="":
    numeric x[]cp.tmp, y[]cp.tmp;
    path cp.tmp;
    _connector.tmp
  else:
    if known cp@#:
      errmessage("redundant connector name: " & (str @#));
    fi;
    _connector@#
  fi($,$$,dsrc,ddst)
enddef;
def _jux(text a,b) =
  if s.h=s.v: ((a)*s.h,(b)*s.v) else: ((b)*s.v,(a)*s.h) fi
enddef;
def _iv(expr a)(suffix b,c,d,e) =
  if (45 <= a) and (a < 135): b
  elseif (135 <= a) and (a < 225): c
  elseif (225 <= a) and (a < 295): d
  else: e fi
enddef;
vardef _connector@#(suffix $,$$)(expr dsrc,ddst) =
  save i, s;
  numeric i[]a, i[]r, i[]l, i[]t, i[]b, i[]x, i[]y, s.h, s.v;
  i0a = (angle dsrc) mod 360;
  i1a = (angle -ddst) mod 360;
  s.h = (if (135 <= i0a) and (i0a < 295): -1 else: 1 fi);
  s.v = (if (45 <= i0a) and (i0a < 225): -1 else: 1 fi);
  _jux(i0l)(i0b) = z$bb  _iv(i0a,lr,ur,ul,ll);
  _jux(i0r)(i0t) = z$bb  _iv(i0a,ul,ll,lr,ur);
  _jux(i1l)(i1b) = z$$bb _iv(i0a,lr,ur,ul,ll);
  _jux(i1r)(i1t) = z$$bb _iv(i0a,ul,ll,lr,ur);
  _jux(i0x)(i0y) = z$    _iv(i0a,um,ml,lm,mr);
  _jux(i1x)(i1y) = z$$   _iv(i1a,um,ml,lm,mr);
  _iv((i1a-i0a+360) mod 360,
      _conn_down,_conn_right,_conn_up,_conn_left)@#
enddef;
vardef _conpath@#(text tail) =
  save n,h;
  numeric n;
  boolean h;
  h := (s.h = s.v);
  if unknown x0cp@#: x0cp@# = (if h: i0x*s.h else: i0y*s.v fi) fi;
  if unknown y0cp@#: y0cp@# = (if h: i0y*s.v else: i0x*s.h fi) fi;
  n := 0;
  for o=tail:
    if h:
      if unknown y[n+1]cp@#: y[n+1]cp@# = y[n]cp@#; fi;
      if unknown x[n+1]cp@#:
        x[n+1]cp@#*(if odd n: s.v else: s.h fi) = o; fi;
    else:
      if unknown x[n+1]cp@#: x[n+1]cp@# = x[n]cp@#; fi;
      if unknown y[n+1]cp@#:
        y[n+1]cp@#*(if odd n: s.v else: s.h fi) = o; fi;
    fi;
    h := not h;
    n := n+1;
  endfor;
  if (unknown cp@#) and (numeric cp@#): path cp@#; fi;
  cp@# = z0cp@# for j=1 upto n: --z[j]cp@# endfor;
  cp@#
enddef;
vardef _conn_right@# =
  if (i0y=i1y) and (i0x <= i1x):
    _conpath@#(i1x)
  elseif (i0r+2cmargin <= i1l) or
         ((i0x <= i1x) and
          (i1b < i0t+2cmargin) and (i1t > i0b-2cmargin)):
    _conpath@#(.5[i0r,i1l],i1y,i1x)
  elseif (i1b >= i0t+2cmargin) or (i1t <= i0b-2cmargin):
    _conpath@#(i0r+cmargin,.5[i0t,i1b],i1l-cmargin,i1y,i1x)
  elseif (i1y <= i0y):
    _conpath@#(i0r+cmargin,min(i0b,i1b)-cmargin,i1l-cmargin,i1y,i1x)
  else:
    _conpath@#(i0r+cmargin,max(i0t,i1t)+cmargin,i1l-cmargin,i1y,i1x)
  fi
enddef;
vardef _conn_up@# =
  if (i1l >= i0r+2cmargin) and (i1y < i0y+cmargin):
    _conpath@#(.5[i0r,i1l],i1b-cmargin,i1x,i1y)
  elseif (i1y < i0y) or
         ((i1x < i0l) and (i1y <= i0t+2cmargin)):
    _conpath@#(max(i0r,i1r)+cmargin,min(i0b,i1b)-cmargin,i1x,i1y)
  elseif (i1x <= i0r) or
         ((i1x < i0r+cmargin) and (i1b >= i0t+2cmargin)):
    _conpath@#(i0r+cmargin,.5[i0t,i1b],i1x,i1y)
  else:
    _conpath@#(i1x,i1y)
  fi
enddef;
vardef _conn_down@# =
  if (i1l >= i0r+2cmargin) and (i1y > i0y-cmargin):
    _conpath@#(.5[i0r,i1l],i1t+cmargin,i1x,i1y)
  elseif (i1y > i0y) or
         ((i1x < i0l) and (i1y <= i0b-2cmargin)):
    _conpath@#(max(i0r,i1r)+cmargin,max(i0t,i1t)+cmargin,i1x,i1y)
  elseif (i1x <= i0r) or
         ((i1x < i0r+cmargin) and (i1b <= i0b-2cmargin)):
    _conpath@#(i0r+cmargin,.5[i0b,i1t],i1x,i1y)
  else:
    _conpath@#(i1x,i1y)
  fi
enddef;
vardef _conn_left@# =
  if (i1x <= i0l-2cmargin) and
     (i1y <= .5[i0b,i0t]) and (i1y > i0b-cmargin):
    _conpath@#(i0r+cmargin,i0b-cmargin,.5[i0l,i1r],i1y,i1x)
  elseif (i1x <= i0l-2cmargin) and
         (i1y > .5[i0b,i0t]) and (i1y < i0t+cmargin):
    _conpath@#(i0r+cmargin,i0t+cmargin,.5[i0l,i1r],i1y,i1x)
  elseif (i1l >= i0r+2cmargin) and
         (i1b < i0y+cmargin) and (i1t > i0y-cmargin):
    if (abs(i1t-i0y) < abs(i0y-i1b)):
      _conpath@#(.5[i0r,i1l],i1t+cmargin,i1r+cmargin,i1y,i1x)
    else:
      _conpath@#(.5[i0r,i1l],i1b-cmargin,i1r+cmargin,i1y,i1x)
    fi
  else:
    _conpath@#(max(i0r,i1r)+cmargin,i1y,i1x)
  fi
enddef;
vardef rshape@#(suffix $)(expr d)(text cap) =
  save a,s;
  a = (angle d) mod 360;
  s.h = (if (135 <= a) and (a < 315): -1 else: 1 fi);
  s.v = (if (45 <= a) and (a < 225): 1 else: -1 fi);
  _jux(x@#c)(y@#c) = z.xf@#c;
  _jux(x@#lc)(y@#lc) = z.xf@#lc;
  forsuffixes u=s,ls,ds:
    z@#u = (if s.h=s.v: z.xf@#u else: (y.xf@#u,x.xf@#u) fi);
  endfor
  forsuffixes u=,bb:
    _jux(x@#u.ul)(y@#u.ul) = z.xf@#u _iv(a,ul,ur,lr,ll);
    _jux(x@#u.ml)(y@#u.ml) = z.xf@#u _iv(a,ml,um,mr,lm);
    _jux(x@#u.ll)(y@#u.ll) = z.xf@#u _iv(a,ll,ul,ur,lr);
    _jux(x@#u.lm)(y@#u.lm) = z.xf@#u _iv(a,lm,ml,um,mr);
    _jux(x@#u.lr)(y@#u.lr) = z.xf@#u _iv(a,lr,ll,ul,ur);
    _jux(x@#u.mr)(y@#u.mr) = z.xf@#u _iv(a,mr,lm,ml,um);
    _jux(x@#u.ur)(y@#u.ur) = z.xf@#u _iv(a,ur,lr,ll,ul);
    _jux(x@#u.um)(y@#u.um) = z.xf@#u _iv(a,um,mr,lm,ml);
  endfor
  inititem@#(cap);
  if itemfinal:
    save pth; path pth;
    pth = $.xf@#() rotated ((a-90) div 90 * 90);
    finitem@#(pth)
  else:
    $.xf@#(false)
  fi
enddef;
vardef supertime expr t of b =
  save s,e; (s,e) = b;
  if t<=-1: t
  elseif t<=1:
    t[s,if e<s: max(ceiling(s)-1,e) else: min(floor(s)+1,e) fi]
  elseif t<=abs(floor(e)-floor(s)):
    if e<s: ceiling(s)-t else: floor(s)+t fi
  elseif t<abs(floor(e)-floor(s))+1:
    (t-floor(t))[if e<s: ceiling(e) else: floor(e) fi,e]
  else: t fi
enddef;
path __poppath[];
def popover(text pths) =
  _popover begingroup
    save __n;
    __n:=0;
    for x=pths:
      __poppath[__n] = begingroup save __poppath; x endgroup;
      __n := __n + 1;
    endfor
    __n
  endgroup
enddef;
tertiarydef p _popover n =
  if cycle p: begingroup
    save t,u,c,q,r,s; path c,q,r,s;
    c = fullcircle scaled 2pradius shifted point 0 of p;
    t = xpart (p intersectiontimes c);
    u = xpart ((reverse p) intersectiontimes c);
    if (t<0) or (u<0): p else:
      q = subpath (0,t) of p;
      r = subpath (0,u) of reverse p;
      for i=0 upto n-1:
        if xpart(q intersectiontimes __poppath[i])>=0:
          s = __popover(subpath (-u,length p - u) of p,n) -- cycle;
        elseif xpart(r intersectiontimes __poppath[i])>=0:
          s = __popover(subpath (t,length p + t) of p,n) -- cycle;
        fi
        exitif known s;
      endfor
      if known s: s else: __popover(p,n) & cycle fi
    fi
  endgroup else: __popover(p,n) fi
enddef;
vardef __popover(expr p,n) =
  save t;
  t := -1;
  for i=0 upto n-1:
    t := xpart(p intersectiontimes __poppath[i]);
    exitif t>=0;
  endfor
  if t<=0: p else:
    save i,c,st,et,sv,ev,a; pair i,sv,ev; path c;
    i = point t of p;
    c = fullcircle scaled 2pradius shifted i;
    st = xpart ((subpath (t,0) of p) intersectiontimes c);
    et = xpart ((subpath (t,length p) of p) intersectiontimes c);
    if (st<0) or (et<0): p else:
      st := supertime st of (t,0);
      et := supertime et of (t,length p);
      sv = point st of p - i;
      ev = point et of p - i;
      a = angle(ev rotated -angle sv);
      __popover(subpath (0,st) of p, n) --
       (if (abs(a)>=179):
          if (-91<angle ev) and (angle ev<89): reverse fi
        elseif a>0: reverse fi
        fullcircle zscaled 2sv cutafter (origin--2ev)) shifted i --
       __popover(subpath (et,length p) of p, n)
    fi
  fi
enddef;
def cfilldraw expr p =
  addto currentpicture
    if cycle p: contour else: doublepath fi p
    withpen currentpen _op_
enddef;
vardef _finarr text t =
  draw _apth t;
  cfilldraw arrowhead _apth t
enddef;
vardef _findarr text t =
  draw _apth t;
  cfilldraw arrowhead _apth withpen currentpen t;
  cfilldraw arrowhead reverse _apth withpen currentpen t;
enddef;
vardef taper(expr p,a) =
  save r;
  numeric r;
  r = sind(a)/cosd(a);
  (point 0 of p +
     r * arclength p * unitvector direction 0 of p rotated 90)
  {(direction 0 of p) rotated -a}
  for t=1 upto (length p)-1:
    .. {(point t of p - precontrol t of p) rotated -a}
       (point t of p +
        r * (arclength subpath (t,length p) of p) *
        dir (.5[angle (point t of p - precontrol t of p),
                angle (postcontrol t of p - point t of p)] + 90))
       {(postcontrol t of p - point t of p) rotated -a}
  endfor
  .. {(direction length p of p) rotated -a}(point length p of p)
enddef;
vardef sarrowhead expr p =
  save q; path q;
  q = subpath (arctime (arclength p - ahlength) of p,length p) of p;
  (taper(q,.5ahangle) &
   reverse taper(q,-.5ahangle) -- cycle)
enddef;
vardef oarrowhead expr p =
  save q; path q;
  q = subpath (arctime (arclength p - ahlength) of p,length p) of p;
  (taper(q,.5ahangle) &
   reverse taper(q,-.5ahangle))
enddef;
vardef varrowhead expr p =
  save va,q,qq;
  numeric va;
  path q,qq;
  va = angle (ahinset*ahlength,
              ahlength*sind(.5ahangle)/cosd(.5ahangle));
  q = subpath (arctime (arclength p - ahlength) of p,length p) of p;
  qq = subpath (0,arctime ahinset*ahlength of q) of q;
  (reverse taper(qq,va) ..
   taper(q,.5ahangle) &
   reverse taper(q,-.5ahangle) ..
   taper(qq,-va) & cycle)
enddef;
newinternal ahinset;
ahinset := 0;
vardef arrowhead expr p =
  if ahinset <= 0: sarrowhead
  elseif ahinset >= 1: oarrowhead
  else: varrowhead fi p
enddef;
\endinput
%%
%% End of file `metaflow.mp'.
