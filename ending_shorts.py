from manim import *

verd= "#3BC66B"
rox= "#862FD1"
cinz= "#363636"
azu= "#131E3E"
lar= "#FF862F"

class Vert(Scene):
    def construct(self):
        background = Rectangle(width = 14.5, height = 8, stroke_width = 0, fill_color = cinz, fill_opacity = 1)
        self.add(background)
        
        t1 = Tex("Assista o vídeo","na íntegra").scale(2).set_color(lar).arrange(DOWN).rotate(PI/2).to_edge(LEFT, buff=1)
        t2 = Tex("Locomotiva", "Universal", "da Curiosidade").scale(2).arrange(DOWN).rotate(PI/2).to_edge(RIGHT, buff=2)
        t2[0].set_color(verd).shift(0.5*RIGHT)
        t2[2].set_color(rox)

        logo = ImageMobject("LC_watermark.png").rotate(PI/2).scale(0.8).shift(LEFT)
        
        self.wait()     
        self.play(LaggedStart(FadeIn(logo, shift=UP), Write(t1), lag_ratio=0.5), run_time=2)
        self.play(FadeIn(t2[0], run_time=2), t2[0].animate.shift(0.5*LEFT),
                  LaggedStart(TransformFromCopy(t2[0], t2[1]), Write(t2[2:], run_time=1), lag_ratio=0.2))
        self.wait()
        self.play(FadeOut(t1), FadeOut(t2), FadeOut(logo))
        self.wait()

class Horiz(Scene):
    def construct(self):
        background = Rectangle(width = 14.5, height = 8, stroke_width = 0, fill_color = cinz, fill_opacity = 1)
        self.add(background)
        
        t1 = Tex("Assista o vídeo na íntegra").scale(2).set_color(lar).to_edge(UP, buff=1)
        a = Tex("Locomotiva", "Universal", "da Curiosidade").scale(2).arrange(DOWN)
        a[0].set_color(verd).shift(0.5*DOWN)
        a[2].set_color(rox)

        logo = ImageMobject("LC_watermark.png").scale(0.8).shift(1*DOWN).to_edge(LEFT, buff=1.5)

        self.wait(0.5)
        self.play(FadeIn(a[0], run_time=2), a[0].animate.shift(0.5*UP),
                  LaggedStart(TransformFromCopy(a[0], a[1]), Write(a[2:], run_time=1), lag_ratio=0.2))
        
        self.play(a.animate.arrange(DOWN, center=False, aligned_edge=LEFT).shift(2*RIGHT+1*DOWN),
                              FadeIn(logo, shift=DOWN+RIGHT), Create(t1))
        self.wait()
        self.play(FadeOut(t1), FadeOut(a), FadeOut(logo))

        

        
