from manim import *

class Titulo(Scene):
    def construct(self):
        verd = "#3BC66B"
        rox = "#862FD1"
        cinz = "#363636"
        azu = "#131E3E"

        #background = Rectangle(width = 14.5, height = 8, stroke_width = 0, fill_color = cinz, fill_opacity = 1)
        #self.add(background)

        a = Tex("Locomotiva", "Universal", "da Curiosidade").scale(2).arrange(DOWN)
        a[0].set_color(verd).shift(0.5*DOWN)
        a[2].set_color(rox)
        
        t = Tex("SOMENTE", "O NECESSÁRIO").scale(3).set_color(ORANGE).arrange(DOWN, buff=0.75)
        
        recta = RoundedRectangle(corner_radius=0.5, height=t.height+1, width=t.width+1)
        rectb = RoundedRectangle(corner_radius=0.5, height=t.height+1, width=t.width+1, fill_color=BLACK, fill_opacity =0.3, stroke_width=0)

        logo = ImageMobject("LC_watermark.png").scale(0.8).to_edge(LEFT, buff=1.5)

        self.wait(0.5)
        self.play(FadeIn(a[0], run_time=2), a[0].animate.shift(0.5*UP),
                  LaggedStart(TransformFromCopy(a[0], a[1]), Write(a[2:], run_time=1), lag_ratio=0.2))
        
        self.play(LaggedStart(a.animate.arrange(DOWN, center=False, aligned_edge=LEFT).shift(2*RIGHT),
                              FadeIn(logo), lag_ratio=0.3))
        self.wait(1.5)


        self.bring_to_back(recta)
        self.bring_to_back(rectb)
        #self.bring_to_back(background)
        self.play(ReplacementTransform(a[0],t[0], run_time=1.5), FadeOut(a[1], shift=LEFT, run_time=1.5),
                  FadeOut(logo, run_time=0.5),
                  ReplacementTransform(a[2:],t[1], run_time=1.5), Create(recta, run_time=1.5), FadeIn(rectb, run_time=1.5))
        self.wait(3)
        self.play(FadeOut(t), FadeOut(recta), FadeOut(rectb))
        self.wait(1)

