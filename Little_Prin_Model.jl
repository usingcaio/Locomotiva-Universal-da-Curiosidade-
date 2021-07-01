### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ c79f3928-1ef4-4fb0-a5ab-9c7d2fbbbc0d
begin
	using Plots; pyplot()
	using Unitful
	using PhysicalConstants
end

# ╔═╡ bd9c0180-d5ca-11eb-208d-bf5e5ee18b4a
md"""
This code is made out in order of seeing consequences of the existence of the Little Prince planet, calculating its properties, seeing consequences in relation to the Earth, making some graphs and so on
"""

# ╔═╡ 3846d205-fc0c-4e35-8676-b706b9a0126a
md"""
Defining our general constants of the problem
"""

# ╔═╡ bbf30dcc-1b66-4b12-bf39-a0ffcc142454
begin
	g_earth = PhysicalConstants.MKS.GravAccel 
	G = PhysicalConstants.MKS.GravitationalConstant
	M_earth  = 5.9722 * 10^(24)
end

# ╔═╡ af75144d-b319-497a-b79a-757543498e6b
md"""
Generating a  graph of g in function of the distance, so we can see the relationship between how gravity behaves as go further away or closer, just as an example
"""

# ╔═╡ 49830db9-8cd4-460e-9e03-0c692bc01a0e
md"""
Since we are pretty lazy in doing calculation by hand, lets compute it all, even if that means computing 1 + 1 hahaha
"""

# ╔═╡ afd47c6b-58c1-42c3-8495-b088448ffd58
md"""
We have 44 sunsets, therefore, taking a $24$h day,the duration of a sunset willbe given by 

$\dfrac{24h \cdot 60min}{44} \simeq 33min$

$\dfrac{360^{\circ}}{x} = 44 \Longrightarrow x = 8.18^{\circ}$ which implies that the planet rotates at  $8.18^{\circ}$ per sunset. 

Since a sunset takes in average $33$min and the Little Prince sees $44$ per day, therefore he takes

$\dfrac{33min \cdot 44}{60min} \simeq 24h$ just seeing sunsets

INCREDIBLY BIZARRE! Which is just awesome! this means he would spend all day observing sunsets at every second 


Since $24$h equals $86400$s and $33$min equals $1920$s, therefore $ 86400s - 1920s = 84480s$ that is $23.45h$ as the time to travel between sunsets
"""

# ╔═╡ a608c740-f2ab-47a7-9381-e6424f97c070
md"""
Well, the Little Prince is a child, if we assume that he has like 5 to 6 years old he is in average $1.14$m and his walking speed is $1.12ms^{-1}$

So, the total distance the Little Prince could walk is given by 

 $s = vt \Longrightarrow s = 1.12 \cdot 84480 \Longrightarrow s = 94.6$km 

is the total distance that he could walk. 




"""

# ╔═╡ 718b0dce-25a2-44a3-9110-23ec5ad41251
r = [2439., 3398., 6052., 6378., 24750., 25559., 60330., 1494., 0.031]

# ╔═╡ 3911fb1b-dc25-49a8-91b3-3757b3b69c3a
rot_t = [1407.07,
24.62,
5839.20,
23.93,
16.05,
17.23,
10.23,
9.92, 
2.26] 

# ╔═╡ 99622efc-b409-40d5-980a-5de8741ec2bb
scatter(r, rot_t)

# ╔═╡ 31c29116-d3af-4b22-8862-231731cc2bb2
md"""
Except this is totally wrong, is a desaster and should definetely not be considered
"""

# ╔═╡ 650be030-46b9-49f9-b6da-0fc5b0fbe60f
md"""
Now performing things in the right way 


Assuming that the sunset on the Little Prince planet takes as long as it takes on Earth and the acceleration due to gravity on his planet is quite similar to ours. 
"""

# ╔═╡ 4e1a3ff0-cfc6-432b-9fd6-7b00486a9829
md"""
So, we have the information that the Little Prince experiences $44$ sunsets in a day, for our assumption we take $3$min in average as the duration of a sunset.

Notice how independent of the planet, it is possible to experience $44$ sunsets as well. On Earth, for example, it would just be necessary to move fast enough to West so that you could see $44$ of these sunsets, but how fast would it be fast enough ? 

A day is $24$h which is $1440$min, so $\dfrac{1440}{44}\simeq 32.7$ as the time that is takes from the start of a sunset to the start of the other one. By this, $32.7 - 3 = 29.7$min would be the time that one would have to travel between sunsets. 

Since $40,075 = 2πr  \Longrightarrow 44s = 40,075 \Longleftrightarrow s \simeq 910.8Km$ 

So, one would have to go $910.8Km$ in $29.7$min in order to go from one sunset to another. Then, unlesss you have a military jet, you'll not be able to do this.
 
"""

# ╔═╡ ae8e8065-b1ef-4f46-b620-d43870b858af
md"""
The Little Prince should be about 6 years old, so by our references we estimated that he runs $1.12$m/s for a child of his age. The Little Prince says he manages this by "walking a few steps", we estimated a that a few could mean $5$ steps and also by our references, we would take a step as $0.9$m which in $5$ steps is $4.5$m, so he would take about $5$ seconds to run this distance. 


So, by knowing how far he walks in an arc of a circle, we can calculate the radius of this tiny planet. 

$44\cdot 4.5 = 2πr \Longleftrightarrow  r = 31.5m$
"""

# ╔═╡ a33afab9-3af4-4673-a9f9-8d07323f4862
md"""
That result makes it possible to calculate the circunference of this planet which is $C = 198$m 

A day woud last for about 

$D = (5s + 3min)*44 = 1day \Longrightarrow D = (0.08333 + 3minj)\cdot44 = 135.66min \simeq 2.26h$

So a day on this tiny little planet would last $2$h$15min$
"""

# ╔═╡ 40d7f31e-45cf-4a11-854b-d5175f4ad891
Rp = 31.5 #meters

# ╔═╡ 2f0583eb-3aa0-488b-9151-7fce00a37956
# Calculating it's mass 

Mp = (g_earth * Rp^2)/G

# ╔═╡ 96cc4b59-fb7e-4b5c-a088-17f113e08e7b
# Calculating the volume of this planet 

V =(4 * π*Rp^3)/3 #m^3  

# ╔═╡ 22080747-6f1e-44b5-9a92-fc9e9ee0aab2
g(R) = (Mp*G)/R^2

# ╔═╡ e23c294e-2bf1-44b9-9b4a-41534dc723e5
R = 0:180

# ╔═╡ 174a3119-072d-4c1e-963a-964bd8420db4
# Now making a graph of the gravity x distance 

plot(R, g, c=:purple, label = "Gravidade conforme distancia no planeta", 
xlabel = "Distance", 
ylabel = "Gravidade",
grid = true)

# ╔═╡ 5b6adf39-74d5-4f12-b408-5fc903ad7bd6
c = PhysicalConstants.MKS.SpeedOfLight

# ╔═╡ 4467b53f-11e7-4ff0-bf34-92ec2397cf4d
# Definying the Schwarzschild radius for the planet

Rs = (2*G*Mp)/c^2 

# ╔═╡ Cell order:
# ╟─bd9c0180-d5ca-11eb-208d-bf5e5ee18b4a
# ╠═c79f3928-1ef4-4fb0-a5ab-9c7d2fbbbc0d
# ╟─3846d205-fc0c-4e35-8676-b706b9a0126a
# ╠═bbf30dcc-1b66-4b12-bf39-a0ffcc142454
# ╟─af75144d-b319-497a-b79a-757543498e6b
# ╟─49830db9-8cd4-460e-9e03-0c692bc01a0e
# ╟─afd47c6b-58c1-42c3-8495-b088448ffd58
# ╠═a608c740-f2ab-47a7-9381-e6424f97c070
# ╠═718b0dce-25a2-44a3-9110-23ec5ad41251
# ╠═3911fb1b-dc25-49a8-91b3-3757b3b69c3a
# ╠═99622efc-b409-40d5-980a-5de8741ec2bb
# ╟─31c29116-d3af-4b22-8862-231731cc2bb2
# ╟─650be030-46b9-49f9-b6da-0fc5b0fbe60f
# ╟─4e1a3ff0-cfc6-432b-9fd6-7b00486a9829
# ╟─ae8e8065-b1ef-4f46-b620-d43870b858af
# ╟─a33afab9-3af4-4673-a9f9-8d07323f4862
# ╠═40d7f31e-45cf-4a11-854b-d5175f4ad891
# ╠═2f0583eb-3aa0-488b-9151-7fce00a37956
# ╠═96cc4b59-fb7e-4b5c-a088-17f113e08e7b
# ╠═22080747-6f1e-44b5-9a92-fc9e9ee0aab2
# ╠═e23c294e-2bf1-44b9-9b4a-41534dc723e5
# ╠═174a3119-072d-4c1e-963a-964bd8420db4
# ╠═5b6adf39-74d5-4f12-b408-5fc903ad7bd6
# ╠═4467b53f-11e7-4ff0-bf34-92ec2397cf4d
