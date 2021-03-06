# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

context = Context.create!(name: 'Default', is_public: true)
user = User.create!(name: "Linda Heilig")
user2 = User.create!(name: "Mike C")
user3 = User.create!(name: "Marguerite Wagner")
user4 = User.create!(name: "Cleveland Dozier")

# https://www.quora.com/What-is-mitosis-Why-is-it-important
chorus = Chorus.create!(name: "What is mitosis? Why is it important?", user: user2, context: context, license: 'cc_by', description: "Examples and explanations from other students.")
Response.create!(name: "It's why hair falls out with chemotherapy.", user: user2, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<div>
<p>Let’s take a different tack with the “importance” angle. What things do you see that can be explained by mitosis? Here’s one I think is interesting: Why does people’s hair fall out when they get chemotherapy for cancer?</p>
<p>Surprisingly, the answer is that chemotherapy drugs target cell division (mitosis). This is because one difference cancer cells have from normal cells is the rate at which they divide. Normal cells divide fairly rarely, but cancer cells divide all the time. If you can stop cancer cells from dividing, you can stop the spread of cancer.</p>
<p>The mechanism that these drugs use to stop cancer is to “disrupt mitotic spindle assembly” (something you see start in prophase of mitosis). This video explains how this works (including why your hair falls out when you get chemo):</p>
<iframe width="560" height="315" src="https://www.youtube.com/embed/BmFEoCFDi-w" frameborder="0" allowfullscreen></iframe>
<p>It’s not an exaggeration to say that better understanding of the process of mitosis in cancer cells will lead (hopefully) to better cancer drugs that are either more effective at stopping cancer or are more targeted (and therefore have less side effects).</p>
</div>
HTML

Response.create!(name: "Why are nerve cell diseases like brain damage, Parkinson's, MS, and Alzheimer's hard to treat?", user: user, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<p>Did you ever wonder why (most) nerve cells do not replace themselves? (In case you didn’t know this, it’s true — nerve cells don’t undergo mitosis, which is one reason why people with brain damage can’t regrow a new brain, and a reason why nerve damage is a difficult condition for which to find remedies).</p>
<p>One reason nerve cells cannot replace themselves is that they lack centrioles. Centrioles, as the video below demonstrates, are crucial in the mitotic process. They are what pulls the replicated DNA in the mitotic process into two separate cells.</p>
<p><iframe width="560" height="315" src="https://www.youtube.com/embed/AhgRhXl7w_g" frameborder="0" allowfullscreen></iframe></p>
<p>Nerve cells do not have centrioles, and thus are unable to divide.</p>
<p>There are a couple interesting implications of this. The first question it raises is why these cells are amitotic (that is, not designed to undergo mitosis). The commonly given reason is that nerve cells are valuable not on their own, but by virtue of what other cells they are connected to. A nerve cell that underwent division and lost its connections would do more harm than good.</p>
<p>But understanding these mechanisms also helps explain why researchers studying diseases of the brain and nervous system (such as Alzheimer’s and Parkinson’s) are so excited by stem cell research. Neural stem cells can divide and propagate — they are programmed both to divide and have the equipment (such as centrioles) to do so. By producing new cells, these stem cells could repair nerve damage, and potentially reverse the progess of diseases such as Parkinson’s, Multiple Sclerosis, and Alzheimer’s.</p>
<p>Understanding how mitosis works in stem cells (and understanding why nerve cells are amitotic) helps researchers develop treatments for these diseases.</p>
HTML



chorus = Chorus.create!(name: "What is solute potential?", user: user3, context: context, license: 'cc_by', description: "Examples and explanations from other students.")
Response.create!(name: "It’s Why Slugs Melt!", user: user4, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<p>Maybe as a kid you were horrible (many kids are) and you tortured slugs in the back yard by putting salt on them and watching them shrivel up. Or maybe as a kid at the lake you were latched onto by leeches that were horrible (most leeches are) and you watched with amazement as you mom slayed them effortlessly with the salt shaker.</p>
<p>If you think about what’s happening here, you’ll have a bit more of a grip on solute potential.</p>
<p>Consider this. You put salt on the slug’s back, which mixes with the water on it. Now you have a membrane (slug skin) with very salty water on the outside and very non-salty water on the inside. The nature of things is in this case that osmosis wants to equalize the saltiness. So a bunch of the water inside the slug rushes past the membrane (skin) to the outside of the slug. Unfortunately, more water on the outside just dissolves more of the salt, which makes the salt imbalance worse, which in turn creates more osmotic pressure to push more water out of the slug. This cycle continues until the slug is a shriveled mess lying in a pool of salty water.</p>
<p>So what’s the solute potential in this example? In this case salt is the solute and water is the solvent. So the solute potential here, at the point the salt is applied, is high on the inside of the slug and low on the outside of it. Putting the salt on the outside of the slug lowers the solute potential of the water on the outside of the slug.</p>
<p>A way of remembering that is that the water on the inside of the slug has a “high potential” of moving to the outside of the slug. The osmotic pressure is a result of the difference in the potential on the two sides of that slug-skin membrane, the salty low-potential outside and the less salty high potential inside. The difference between the solute potential of the outside and the inside is one of a few factors that determine overall water potential.</p>
<p>If you think about this, this is not just a property of slugs. People dry flowers with salt, and before refrigeration we would sometimes dehydrate foods in this way. That salty french fry on the floor of your car that lasts for years without molding? It’s been dehydrated too, and the way the water got from the inside to the outside of the fry is through a difference in solute potential.</p>
HTML

Response.create!(name: "It’s the Negative Impact of Solutes on Water Potential", user: user2, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<div class="entry-content" style="height:100%">
<p>I know, fascinating right? But there are a couple of things to note here.</p>
<p>Other explanations of solute potential often mention that “osmosis wants to equalize the saltiness” on two sides of a membrane. But when we say “want” in terms of physical processes, we are talking about physical mechanisms, not desires.</p>
<p>So let’s start with an observed phenomenon:</p>
<p style="float: right; margin-left: 20px;"><img src="http://rainystreets.wikity.cc/files/2016/10/0307_Osmosis-first.jpg" alt="" title="From Wikipedia Osmosis Article, CC-BY-SA"><div class="img-caption" style="width: 300px; font-size: 80%;"><em>From Wikipedia Osmosis Article, CC-BY-SA</em></div></p>
<p>Here’s a beaker with a semi-permeable membrane. In this first picture, there are two equally full sides of the beaker, but one has saltier water on one side than the other. (We use salt here, but it could be other solutes as well).</p>
<p>Now what happens? Seriously, think about it for a minute. You leave this glass overnight, go to sleep, and come back in the morning: what do you see?</p>
<p>If you’re like most people, you probably think you see a beaker that looks just like the one above, but with the saltiness “averaged out”.</p>
<p>But if you thought that, you’d be wrong. Because here is what you’d find on your counter:</p>
<p style="float: right; margin-left: 20px;"><img src="http://rainystreets.wikity.cc/files/2016/10/0307_Osmosis-second.jpg" alt="" title="From Wikipedia Osmosis Article, CC-BY-SA"><div class="img-caption" style="width: 284px; font-size: 80%;"><em>From Wikipedia Osmosis Article, CC-BY-SA</em></div></p>
<p>You’ll notice that the saltiness on each side of the membrane is equal, but this has been achieved by moving water, not salt molecules.</p>
<p>The reason for this is simple. For this semi-permeable membrane, water molecules can cross it, but the solute particles, which are larger and polar, cannot. As water molecules pass freely between the two sides, some of them bind to the solute, and are unable to pass back through the membrane. See this animation to see how that happens:</p>
<p><iframe width="660" height="495" src="https://www.youtube.com/embed/w3_8FSrqc-I?feature=oembed" frameborder="0" allowfullscreen=""></iframe></p>
<p>First, pure water (no solutes) has a solute potential (Ψπ) of zero. Solutes reduce water’s potential, limiting the ability of the solution to flow through a membrane.</p>
<p>Solute concentration relates to solute potential according to the given by the Van’t Hoff Equation:</p>
<p>Ψπ = − miRT</p>
<p>where m is the concentration in molarity of the solute, i is the Van’t Hoff factor, the ionization constant of the solute (1 for glucose, 2 for NaCl, etc.) R is the ideal gas constant, and T is the temperature.</p>
<p>The more solute molecules present in the , the more negative the solute potential is.</p>
<p>Solute potential has important implication for many living organisms. If a living cell with a lower solute concentration is surrounded by a concentrated solution, the cell will tend to lose water to the more negative water potential of the surrounding environment.</p>
<p>You can demonstrate this process in your kitchen using common eggs dropped in a hypertonic solution such as corn syrup:</p>
<p><iframe width="660" height="371" src="https://www.youtube.com/embed/SSS3EtKAzYc?feature=oembed" frameborder="0" allowfullscreen=""></iframe></p>
<p><strong>Credits</strong></p>
<p>Pieces of this explanation come from <a href="https://en.wikipedia.org/wiki/Water_potential">Wikipedia</a>.</p>
</div>
HTML


Response.create!(name: "It’s Why You Put Saline Solution in an IV", user: user, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<div class="entry-content" style="height:100%">
<p>When people get dehydrated, or when they need an intravenous drug they are given an IV with a saline solution. </p>
<p>Why is this?</p>
<p>Well, consider that your blood is pretty salty, and the blood cells in the solution that is your blood are used to that salinity. Think a minute what would happen to the blood cells if suddenly they were surrounded by a hypotonic solution (distilled water) rather than a hypertonic one (saline or blood).</p>
<p>What would happen to the blood cells? Would they expand, contract, or stay the same?</p>
<p>They’d expand. Let’s walk through this.</p>
<p>Your blood cells currently exist in osmotic balance with your blood. Your blood is made less salty via the addition of water. </p>
<p>Now the saltiness has to equalize, but it can’t equalize by virtue of moving the solute (in this case salt) because the solute cannot move through cell membranes. So the water has to move. And since the cells have more solute, the water will move into the cells. </p>
<p>Eventually, the cells will burst.</p>
<p>The opposite is true if the saline solution is too salty. In this case the cells will shrivel.</p>
<p>Don’t believe me? Take a look under a microscope:</p>
<p><iframe width="660" height="495" src="https://www.youtube.com/embed/OYoaLzobQmk?feature=oembed" frameborder="0" allowfullscreen=""></iframe></p>
</div>
HTML