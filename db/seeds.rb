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

# https://www.quora.com/What-is-mitosis-Why-is-it-important
chorus = Chorus.create!(name: "What is mitosis? Why is it important?", user: user2, context: context, license: 'cc_by', description: <<HTML)
<div>
<p>Let’s take a different tack with the “importance” angle. What things do you see that can be explained by mitosis? Here’s one I think is interesting: Why does people’s hair fall out when they get chemotherapy for cancer?</p>
<p>Surprisingly, the answer is that chemotherapy drugs target cell division (mitosis). This is because one difference cancer cells have from normal cells is the rate at which they divide. Normal cells divide fairly rarely, but cancer cells divide all the time. If you can stop cancer cells from dividing, you can stop the spread of cancer.</p>
<p>The mechanism that these drugs use to stop cancer is to “disrupt mitotic spindle assembly” (something you see start in prophase of mitosis). This video explains how this works (including why your hair falls out when you get chemo):</p>
<iframe width="560" height="315" src="https://www.youtube.com/embed/BmFEoCFDi-w" frameborder="0" allowfullscreen></iframe>
<p>It’s not an exaggeration to say that better understanding of the process of mitosis in cancer cells will lead (hopefully) to better cancer drugs that are either more effective at stopping cancer or are more targeted (and therefore have less side effects).</p>
</div>
HTML

Response.create!(name: "Re: What is mitosis? Why is it important?", user: user, context: context, chorus: chorus, license: 'cc_by', description: <<HTML)
<p>Did you ever wonder why (most) nerve cells do not replace themselves? (In case you didn’t know this, it’s true — nerve cells don’t undergo mitosis, which is one reason why people with brain damage can’t regrow a new brain, and a reason why nerve damage is a difficult condition for which to find remedies).</p>
<p>One reason nerve cells cannot replace themselves is that they lack centrioles. Centrioles, as the video below demonstrates, are crucial in the mitotic process. They are what pulls the replicated DNA in the mitotic process into two separate cells.</p>
<p><iframe width="560" height="315" src="https://www.youtube.com/embed/AhgRhXl7w_g" frameborder="0" allowfullscreen></iframe></p>
<p>Nerve cells do not have centrioles, and thus are unable to divide.</p>
<p>There are a couple interesting implications of this. The first question it raises is why these cells are amitotic (that is, not designed to undergo mitosis). The commonly given reason is that nerve cells are valuable not on their own, but by virtue of what other cells they are connected to. A nerve cell that underwent division and lost its connections would do more harm than good.</p>
<p>But understanding these mechanisms also helps explain why researchers studying diseases of the brain and nervous system (such as Alzheimer’s and Parkinson’s) are so excited by stem cell research. Neural stem cells can divide and propagate — they are programmed both to divide and have the equipment (such as centrioles) to do so. By producing new cells, these stem cells could repair nerve damage, and potentially reverse the progess of diseases such as Parkinson’s, Multiple Sclerosis, and Alzheimer’s.</p>
<p>Understanding how mitosis works in stem cells (and understanding why nerve cells are amitotic) helps researchers develop treatments for these diseases.</p>
HTML
Response.create!(name: "Re: What is mitosis? Why is it important?", user: user2, context: context, chorus: chorus, license: 'cc_by', description: 'Response 2')
Response.create!(name: "Re: What is mitosis? Why is it important?", context: context, chorus: chorus, license: 'cc_by', description: 'Response 3')
Response.create!(name: "Re: What is mitosis? Why is it important?", context: context, chorus: chorus, license: 'cc_by', description: 'Response 4')