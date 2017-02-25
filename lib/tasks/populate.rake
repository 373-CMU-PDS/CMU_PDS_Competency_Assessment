# code structure credited to Larry Heimann
namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    Rake::Task['db:migrate'].invoke

    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'

    # Step 1: clear any old data in the db
    [IndicatorResource, Indicator, Resource, Competency, IndicatorQuestion, Question, User].each(&:delete_all)

    # Step 2: create the competency
    c1 = Competency.new
    c1.name = "Communication"
    c1.active = true
    c1.save!

    c2 = Competency.new
    c2.name = "Utilizing Technology"
    c2.active = true
    c2.save!

    # Step 3: add the indicators

    i1 = Indicator.new
    i1.level = "Companion"
    i1.description = "Able to organize own thoughts and outline intended meaning of a message"
    i1.active = true
    i1.competency = c1
    i1.save!

    i2 = Indicator.new
    i2.level = "Companion"
    i2.description = "Able to identify and may employ active listening skills"
    i2.active = true
    i2.competency = c1
    i2.save!

    i3 = Indicator.new
    i3.level = "Companion"
    i3.description = "Able to identify common nonverbal cues"
    i3.active = true
    i3.competency = c1
    i3.save!

    i4 = Indicator.new
    i4.level = "Companion"
    i4.description = "Able to identify various media used to deliver messages"
    i4.active = true
    i4.competency = c1
    i4.save!

    i5 = Indicator.new
    i5.level = "Companion"
    i5.description = "Able to comprehend the content of oral and written messages by applying personal context to interpret the meaning"
    i5.active = true
    i5.competency = c1
    i5.save!

    i6 = Indicator.new
    i6.level = "Companion"
    i6.description = "Able to present simple, familiar information to familiar audiences by using preferred method of communication"
    i6.active = true
    i6.competency = c1
    i6.save!

    i7 = Indicator.new
    i7.level = "Companion"
    i7.description = "Able to present intentions and ideas to a familiar individual when prompted by the individual"
    i7.active = true
    i7.competency = c1
    i7.save!

    i8 = Indicator.new
    i8.level = "Contributor"
    i8.description = "Able to select the most appropriate medium of communication to deliver a menaningful message"
    i8.active = true
    i8.competency = c1
    i8.save!

    i9 = Indicator.new
    i9.level = "Contributor"
    i9.description = "Able to clearly and concisely deliver the meaning of a message using various media"
    i9.active = true
    i9.competency = c1
    i9.save!

    i10 = Indicator.new
    i10.level = "Contributor"
    i10.description = "Able to actively listen to others and clarify the meaning of a message"
    i10.active = true
    i10.competency = c1
    i10.save!

    i11 = Indicator.new
    i11.level = "Contributor"
    i11.description = "Able to evaluate previous interactions and develop a communication strategy to accommodate audience's preferences"
    i11.active = true
    i11.competency = c1
    i11.save!

    i12 = Indicator.new
    i12.level = "Contributor"
    i12.description = "Able to present written communication in an easy-to-read format"
    i12.active = true
    i12.competency = c1
    i12.save!

    i13 = Indicator.new
    i13.level = "Contributor"
    i13.description = "Able to articulate intentions, ideas, and feelings to a large group"
    i13.active = true
    i13.competency = c1
    i13.save!

    i14 = Indicator.new
    i14.level = "Contributor"
    i14.description = "Able to articulate thoughts using proper grammer in written and verbal form"
    i14.active = true
    i14.competency = c1
    i14.save!

    i15 = Indicator.new
    i15.level = "Contributor"
    i15.description = "Able to deliver an informational message which encourages others to take action"
    i15.active = true
    i15.competency = c1
    i15.save!

    i16 = Indicator.new
    i16.level = "Champion"
    i16.description = "Able to evaluate the environment and/or audience to determine the most appropriate medium for delivering a meaningful message"
    i16.active = true
    i16.competency = c1
    i16.save!

    i17 = Indicator.new
    i17.level = "Champion"
    i17.description = "Able to determine the effectiveness of a chosen medium in delivering a message"
    i17.active = true
    i17.competency = c1
    i17.save!

    i18 = Indicator.new
    i18.level = "Champion"
    i18.description = "Able to deliver an inspiring and informative message regarding departmental and/or organizational objectives using multiple modes of communication"
    i18.active = true
    i18.competency = c1
    i18.save!

    i19 = Indicator.new
    i19.level = "Champion"
    i19.description = "Able to paraphrase or extract meaning from others' communication"
    i19.active = true
    i19.competency = c1
    i19.save!

    i20 = Indicator.new
    i20.level = "Champion"
    i20.description = "Able to identify and interpret nonverbal cues"
    i20.active = true
    i20.competency = c1
    i20.save!

    i21 = Indicator.new
    i21.level = "Champion"
    i21.description = "Able to adjust communication approach while delivering a message by analyzing the audience's verbal and nonverbal cues"
    i21.active = true
    i21.competency = c1
    i21.save!

    i22 = Indicator.new
    i22.level = "Champion"
    i22.description = "Able to encourage others to openly and clearly express intentions and ideas"
    i22.active = true
    i22.competency = c1
    i22.save!

    i23 = Indicator.new
    i23.level = "Champion"
    i23.description = "Able to help others develop appropriate and effective communication strategies"
    i23.active = true
    i23.competency = c1
    i23.save!

    i24 = Indicator.new
    i24.level = "Champion"
    i24.description = "Able to clarify complex information into simple, easy-to-understand terms and translate complex concepts for a broader audience"
    i24.active = true
    i24.competency = c1
    i24.save!

    # Step 3: add the resoruces

    r1 = Resource.new
    r1.name = "Basic Concepts of Intercultural Communication: Paradigms, Principles and Practices, Second Edition"
    r1.resource_category = "Build Understanding"
    r1.description = ""
    r1.link = ""
    r1.save!

    r2 = Resource.new
    r2.name = "Communication Skills for Dummies"
    r2.resource_category = "Build Understanding"
    r2.description = ""
    r2.link = ""
    r2.save!

    r3 = Resource.new
    r3.name = "Crisis Communications: The Definitive Guide to Managing the Message"
    r3.resource_category = "Build Understanding"
    r3.description = ""
    r3.link = ""
    r3.save!

    r4 = Resource.new
    r4.name = "How to Read a Client from Across the Room: Win More Business with the Proven Character Code System to Decode Verbal & Nonverbal Communication"
    r4.resource_category = "Build Understanding"
    r4.description = ""
    r4.link = ""
    r4.save!

    r5 = Resource.new
    r5.name = "How to Succeed with People: The Remarkable Truth about How to Get the Most Out of Dealing with Others"
    r5.resource_category = "Build Understanding"
    r5.description = ""
    r5.link = ""
    r5.save!

    r6 = Resource.new
    r6.name = "How To Talk To Absolutely Anyone: Confident Communication in Every Situation"
    r6.resource_category = "Build Understanding"
    r6.description = ""
    r6.link = ""
    r6.save!

    r7 = Resource.new
    r7.name = "I Hear You: Repair Communication Breakdowns; Negotiate Successfully; and Build Consensus . . . in Three Simple Steps"
    r7.resource_category = "Build Understanding"
    r7.description = ""
    r7.link = ""
    r7.save!

    r8 = Resource.new
    r8.name = "On Message: Precision Communication for the Digital Age"
    r8.resource_category = "Build Understanding"
    r8.description = ""
    r8.link = ""
    r8.save!

    r9 = Resource.new
    r9.name = "The Snowball Effect: Communication Techniques to Make You Unstoppable"
    r9.resource_category = "Build Understanding"
    r9.description = ""
    r9.link = ""
    r9.save!

    r10 = Resource.new
    r10.name = "Implosion: What the Internet has Really Done to Culture and Communications"
    r10.resource_category = "Build Understanding"
    r10.description = ""
    r10.link = ""
    r10.save!

    r11 = Resource.new
    r11.name = "Whoever Tells the Best Story Wins: How to Use Your Own Stories to Communicate with Power and Impact, Second Edition"
    r11.resource_category = "Build Understanding"
    r11.description = ""
    r11.link = ""
    r11.save!

    r12 = Resource.new
    r12.name = "Communicating Across Cultures"
    r12.resource_category = "Get Connected"
    r12.description = ""
    r12.link = ""
    r12.save!

    r13 = Resource.new
    r13.name = "Culture and Its Effect on Communication  "
    r13.resource_category = "Get Connected"
    r13.description = ""
    r13.link = ""
    r13.save!

    r14 = Resource.new
    r14.name = "Improving Communication in Cross-Cultural Relationships"
    r14.resource_category = "Get Connected"
    r14.description = ""
    r14.link = ""
    r14.save!

    r15 = Resource.new
    r15.name = "Interpersonal Communication: Being Approachable"
    r15.resource_category = "Get Connected"
    r15.description = ""
    r15.link = ""
    r15.save!

    r16 = Resource.new
    r16.name = "Interpersonal Communication: Communicating Assertively"
    r16.resource_category = "Get Connected"
    r16.description = ""
    r16.link = ""
    r16.save!

    r17 = Resource.new
    r17.name = "Interpersonal Communication: Communicating with Confidence"
    r17.resource_category = "Get Connected"
    r17.description = ""
    r17.link = ""
    r17.save!

    r18 = Resource.new
    r18.name = "Interpersonal Communication: Listening Essentials"
    r18.resource_category = "Get Connected"
    r18.description = ""
    r18.link = ""
    r18.save!

    r19 = Resource.new
    r19.name = "Interpersonal Communication: Targeting Your Message"
    r19.resource_category = "Get Connected"
    r19.description = ""
    r19.link = ""
    r19.save!

    r20 = Resource.new
    r20.name = "Preparing to Communicate Effectively at the 'C' Level"
    r20.resource_category = "Get Connected"
    r20.description = ""
    r20.link = ""
    r20.save!

    r21 = Resource.new
    r21.name = "Techniques for Communicating Effectively with Senior Executives"
    r21.resource_category = "Get Connected"
    r21.description = ""
    r21.link = ""
    r21.save!

    r22 = Resource.new
    r22.name = "Powerless to Powerful: Taking Control"
    r22.resource_category = "Get Connected"
    r22.description = ""
    r22.link = ""
    r22.save!

    r23 = Resource.new
    r23.name = "Business Writing Strategies"
    r23.resource_category = "Get Connected"
    r23.description = ""
    r23.link = ""
    r23.save!

    r24 = Resource.new
    r24.name = "Note-taking for Business Professionals"
    r24.resource_category = "Get Connected"
    r24.description = ""
    r24.link = ""
    r24.save!

    r25 = Resource.new
    r25.name = "Learning to Say No"
    r25.resource_category = "Get Connected"
    r25.description = ""
    r25.link = ""
    r25.save!

    r26 = Resource.new
    r26.name = "Volunteer to write an agenda for your team’s next meeting."
    r26.resource_category = "Do Something"
    r26.description = ""
    r26.link = ""
    r26.save!

    r27 = Resource.new
    r27.name = "Observe a presentation and observe the presenter’s communication skills. Identify which methods contributed to an impactful message and which detracted from the meaning of the message."
    r27.resource_category = "Do Something"
    r27.description = ""
    r27.link = ""
    r27.save!

    r28 = Resource.new
    r28.name = "Draft an important email you need to send and ask your supervisor to review it to ensure it is clear and delivers the intended meaning of the message.  "
    r28.resource_category = "Do Something"
    r28.description = ""
    r28.link = ""
    r28.save!

    r29 = Resource.new
    r29.name = "Practice active listening skills when meeting with your supervisor. You can then review what was heard and ask your supervisor for feedback."
    r29.resource_category = "Do Something"
    r29.description = ""
    r29.link = ""
    r29.save!

    r30 = Resource.new
    r30.name = "Practice new communication skills when presenting familiar information to various individuals."
    r30.resource_category = "Do Something"
    r30.description = ""
    r30.link = ""
    r30.save!

    r31 = Resource.new
    r31.name = "Be aware of your nonverbal cues. Ask a colleague to indicate the message your nonverbal cues are delivering."
    r31.resource_category = "Do Something"
    r31.description = ""
    r31.link = ""
    r31.save!

    r32 = Resource.new
    r32.name = "Outline the intended message of an important communication and gain feedback from your supervisor and colleagues before delivering it."
    r32.resource_category = "Do Something"
    r32.description = ""
    r32.link = ""
    r32.save!

    r33 = Resource.new
    r33.name = "Identify the cause(s) of a misunderstanding that occurred and develop a plan to avoid it in the future."
    r33.resource_category = "Do Something"
    r33.description = ""
    r33.link = ""
    r33.save!

    r34 = Resource.new
    r34.name = "Identify how you acquired and developed your best communication skill. Then, use that insight to develop additional communication skills."
    r34.resource_category = "Do Something"
    r34.description = ""
    r34.link = ""
    r34.save!

    r35 = Resource.new
    r35.name = "Volunteer to teach a new work process or procedure to a colleague."
    r35.resource_category = "Do Something"
    r35.description = ""
    r35.link = ""
    r35.save!

    r36 = Resource.new
    r36.name = "Write your perception of the meaning of a message following an interaction with an individual who is unfamiliar to you. Then, follow-up with the person to ensure that you have accurately interpreted the message."
    r36.resource_category = "Do Something"
    r36.description = ""
    r36.link = ""
    r36.save!

    r37 = Resource.new
    r37.name = "Be aware of the number of times you engage in active listening techniques and reflect on how such techniques impact your ability to understand a message."
    r37.resource_category = "Do Something"
    r37.description = ""
    r37.link = ""
    r37.save!

    r38 = Resource.new
    r38.name = "Identify a situation where miscommunication occurs and develop a plan to clarify the miscommunication."
    r38.resource_category = "Do Something"
    r38.description = ""
    r38.link = ""
    r38.save!

    r39 = Resource.new
    r39.name = "Offer to review a colleague’s written communication."
    r39.resource_category = "Do Something"
    r39.description = ""
    r39.link = ""
    r39.save!

    r40 = Resource.new
    r40.name = "Attend public speaking events to identify new communication skills."
    r40.resource_category = "Do Something"
    r40.description = ""
    r40.link = ""
    r40.save!

    r41 = Resource.new
    r41.name = "Offer to facilitate your next team meeting."
    r41.resource_category = "Do Something"
    r41.description = ""
    r41.link = ""
    r41.save!

    r42 = Resource.new
    r42.name = "Identify a presentation that needs to be completed and offer to develop and present it. Ask your supervisor and colleagues to provide feedback following the presentation."
    r42.resource_category = "Do Something"
    r42.description = ""
    r42.link = ""
    r42.save!

    r43 = Resource.new
    r43.name = "Ask multiple colleagues to review your written work in order to identify common errors, then focus to improve them."
    r43.resource_category = "Do Something"
    r43.description = ""
    r43.link = ""
    r43.save!

    r44 = Resource.new
    r44.name = "Identify different delivery methods by interacting with individuals from diverse backgrounds (individuals from different departments, different positions, etc.)."
    r44.resource_category = "Do Something"
    r44.description = ""
    r44.link = ""
    r44.save!

    r45 = Resource.new
    r45.name = "Request feedback from audience members in order to identify gaps between the intended message and the message the audience perceived."
    r45.resource_category = "Do Something"
    r45.description = ""
    r45.link = ""
    r45.save!

    r46 = Resource.new
    r46.name = "Develop an improvement plan and present it to your supervisor and colleagues to communicate a process or procedure within the department."
    r46.resource_category = "Do Something"
    r46.description = ""
    r46.link = ""
    r46.save!

    r47 = Resource.new
    r47.name = "Document the feedback you receive regarding your communication approach and effectiveness in order to identify consistent themes in the feedback."
    r47.resource_category = "Do Something"
    r47.description = ""
    r47.link = ""
    r47.save!

    r48 = Resource.new
    r48.name = "Develop a communication plan for a project or an initiative you are responsible for completing. Then you can strategically deliver the message using the most effective medium."
    r48.resource_category = "Do Something"
    r48.description = ""
    r48.link = ""
    r48.save!

    r49 = Resource.new
    r49.name = "Practice changing nonverbal cues during conversation in order to best portray the intended meaning of the message."
    r49.resource_category = "Do Something"
    r49.description = ""
    r49.link = ""
    r49.save!

    r50 = Resource.new
    r50.name = "Look for opportunities to collaborate with colleagues and others outside your department in order to strengthen your ability to accommodate various audiences.  "
    r50.resource_category = "Do Something"
    r50.description = ""
    r50.link = ""
    r50.save!

    r51 = Resource.new
    r51.name = "Take a lead role in communicating a strategic plan for your department/organization."
    r51.resource_category = "Do Something"
    r51.description = ""
    r51.link = ""
    r51.save!

    r52 = Resource.new
    r52.name = "Seek opportunities to present complex information to a large group of people."
    r52.resource_category = "Do Something"
    r52.description = ""
    r52.link = ""
    r52.save!

    r53 = Resource.new
    r53.name = "Offer colleagues assistance as they prepare to deliver high-impact, large-scale messages."
    r53.resource_category = "Do Something"
    r53.description = ""
    r53.link = ""
    r53.save!

    r54 = Resource.new
    r54.name = "Offer support to colleagues and ask probing questions to encourage others to openly share ideas with you."
    r54.resource_category = "Do Something"
    r54.description = ""
    r54.link = ""
    r54.save!

    r55 = Resource.new
    r55.name = "Draft a plan to improve communication within your department. Gain feedback from colleagues and your supervisor."
    r55.resource_category = "Do Something"
    r55.description = ""
    r55.link = ""
    r55.save!

    r56 = Resource.new
    r56.name = "Discuss your communication style with others in your group. Ask for feedback."
    r56.resource_category = "Engage With Others"
    r56.description = ""
    r56.link = ""
    r56.save!

    r57 = Resource.new
    r57.name = "Ask others in your group how they prefer to communicate. Do their preferences change based on the situation?"
    r57.resource_category = "Engage With Others"
    r57.description = ""
    r57.link = ""
    r57.save!

    r58 = Resource.new
    r58.name = "Invite a colleague out to lunch. Use your listening skills to learn more about him or her."
    r58.resource_category = "Engage With Others"
    r58.description = ""
    r58.link = ""
    r58.save!

    r59 = Resource.new
    r59.name = "Identify a colleague who you feel expresses his or her ideas effectively. Observe his or her behavior when faced with a conflict situation."
    r59.resource_category = "Engage With Others"
    r59.description = ""
    r59.link = ""
    r59.save!

    r60 = Resource.new
    r60.name = "Identify a colleague who communicates effectively in writing. Ask if he or she can review an important email before you send."
    r60.resource_category = "Engage With Others"
    r60.description = ""
    r60.link = ""
    r60.save!

    r61 = Resource.new
    r61.name = "Attend an event or celebration with colleagues. Observe their non-verbal cues as they speak with you and with others."
    r61.resource_category = "Engage With Others"
    r61.description = ""
    r61.link = ""
    r61.save!

    r62 = Resource.new
    r62.name = "Attend a conference or networking event where you know very few people. Practice introducing yourself and asking questions to get to know others."
    r62.resource_category = "Engage With Others"
    r62.description = ""
    r62.link = ""
    r62.save!

    r63 = Resource.new
    r63.name = "Ask for feedback from colleagues or your supervisor on written and verbal messages – are you able to deliver your intended message in a way that encourages others and provides important information?"
    r63.resource_category = "Engage With Others"
    r63.description = ""
    r63.link = ""
    r63.save!

    r64 = Resource.new
    r64.name = "Connect with a colleague and offer to proofread his or her written communication. Ask him or her to proofread your written communication.  "
    r64.resource_category = "Engage With Others"
    r64.description = ""
    r64.link = ""
    r64.save!

    r65 = Resource.new
    r65.name = "Ask a colleague to provide feedback regarding your nonverbal cues."
    r65.resource_category = "Engage With Others"
    r65.description = ""
    r65.link = ""
    r65.save!

    r66 = Resource.new
    r66.name = "Connect with individuals within other departments to identify best practices for communicating a new initiative."
    r66.resource_category = "Engage With Others"
    r66.description = ""
    r66.link = ""
    r66.save!

    r67 = Resource.new
    r67.name = "During a conversation with a colleague, ask probing questions and create an open environment to encourage him or her to openly share feedback with you. "
    r67.resource_category = "Engage With Others"
    r67.description = ""
    r67.link = ""
    r67.save!

    r68 = Resource.new
    r68.name = "Practice providing positive feedback by acknowledging when someone exceeds your expectations. "
    r68.resource_category = "Engage With Others"
    r68.description = ""
    r68.link = ""
    r68.save!

    r69 = Resource.new
    r69.name = "Engage colleagues - particularly companions and contributors – in the process of determining an appropriate medium for an important message that needs to be sent, or information that needs to be shared. "
    r69.resource_category = "Engage With Others"
    r69.description = ""
    r69.link = ""
    r69.save!

    r70 = Resource.new
    r70.name = "Invite other good communicators to a meeting you will lead. Request feedback regarding the nonverbal messages you sent"
    r70.resource_category = "Engage With Others"
    r70.description = ""
    r70.link = ""
    r70.save!

    r71 = Resource.new
    r71.name = "Help colleagues – particularly companions and contributors – develop communication strategies to improve written, nonverbal, and verbal communication.  "
    r71.resource_category = "Engage With Others"
    r71.description = ""
    r71.link = ""
    r71.save!

    r72 = Resource.new
    r72.name = "Written Communication "
    r72.resource_category = "Learn More"
    r72.description = ""
    r72.link = ""
    r72.save!

    r73 = Resource.new
    r73.name = "That's Not What I Wanted to Hear: Customer Service for the Unhappy Customer "
    r73.resource_category = "Learn More"
    r73.description = ""
    r73.link = ""
    r73.save!

    r74 = Resource.new
    r74.name = "Speakers Bureau Program"
    r74.resource_category = "Learn More"
    r74.description = ""
    r74.link = ""
    r74.save!

    r75 = Resource.new
    r75.name = "So You Are New… Communication and Culture at CMU"
    r75.resource_category = "Learn More"
    r75.description = ""
    r75.link = ""
    r75.save!

    r76 = Resource.new
    r76.name = "Organizational Communication "
    r76.resource_category = "Learn More"
    r76.description = ""
    r76.link = ""
    r76.save!

    r77 = Resource.new
    r77.name = "Listening Skills "
    r77.resource_category = "Learn More"
    r77.description = ""
    r77.link = ""
    r77.save!

    r78 = Resource.new
    r78.name = "Get Up and Go: Motivating Others"
    r78.resource_category = "Learn More"
    r78.description = ""
    r78.link = ""
    r78.save!

    r79 = Resource.new
    r79.name = "Creating an Exceptional Customer Experience"
    r79.resource_category = "Learn More"
    r79.description = ""
    r79.link = ""
    r79.save!

    r80 = Resource.new
    r80.name = "Conflict Resolution"
    r80.resource_category = "Learn More"
    r80.description = ""
    r80.link = ""
    r80.save!

    r81 = Resource.new
    r81.name = "Communication Strategies in the Workplace "
    r81.resource_category = "Learn More"
    r81.description = ""
    r81.link = ""
    r81.save!

    r82 = Resource.new
    r82.name = "Collaboration 101 "
    r82.resource_category = "Learn More"
    r82.description = ""
    r82.link = ""
    r82.save!

    r83 = Resource.new
    r83.name = "Assertive Communication "
    r83.resource_category = "Learn More"
    r83.description = ""
    r83.link = ""
    r83.save!

    r84 = Resource.new
    r84.name = "Think about a time when you needed clarification on a request from your supervisor. How did you seek clarification? Did you receive the information you needed?"
    r84.resource_category = "Reflect On It"
    r84.description = ""
    r84.link = ""
    r84.save!

    r85 = Resource.new
    r85.name = "Think about a time when you chose to communicate in person, rather than by phone. Why did you make those choices? What were the outcomes? How would the outcomes have been different if you had chosen another mode of communication?"
    r85.resource_category = "Reflect On It"
    r85.description = ""
    r85.link = ""
    r85.save!

    r86 = Resource.new
    r86.name = "Think about how you communicate with your supervisor. Then, think about how you communicate with co-workers. Do you change your communication style based on who you’re communicating with? How so?"
    r86.resource_category = "Reflect On It"
    r86.description = ""
    r86.link = ""
    r86.save!

    r87 = Resource.new
    r87.name = "Does my communication approach result in others understanding my intended message?"
    r87.resource_category = "Reflect On It"
    r87.description = ""
    r87.link = ""
    r87.save!

    r88 = Resource.new
    r88.name = "How often do I practice active listening skills?"
    r88.resource_category = "Reflect On It"
    r88.description = ""
    r88.link = ""
    r88.save!

    r89 = Resource.new
    r89.name = "When delivering a message, do I overuse my preferred method of communication, or do I try various methods?"
    r89.resource_category = "Reflect On It"
    r89.description = ""
    r89.link = ""
    r89.save!

    r90 = Resource.new
    r90.name = "Reflect on a time when you communicated a complicated idea successfully. What strategies did you use to ensure your communication was effective?"
    r90.resource_category = "Reflect On It"
    r90.description = ""
    r90.link = ""
    r90.save!

    r91 = Resource.new
    r91.name = "Reflect on a time when someone misunderstood your e-mail, letter or other written communication. Why did the misunderstanding occur? How could you have clarified your written message?"
    r91.resource_category = "Reflect On It"
    r91.description = ""
    r91.link = ""
    r91.save!

    r92 = Resource.new
    r92.name = "Recall a time when someone neglected to inform you about an important decision. How did you address the problem? How can you ensure you are included in future communications?"
    r92.resource_category = "Reflect On It"
    r92.description = ""
    r92.link = ""
    r92.save!

    r93 = Resource.new
    r93.name = "Think about a time when you neglected to inform someone of an important decision. What could you have done to include this person in your communication? How did you rectify the situation?"
    r93.resource_category = "Reflect On It"
    r93.description = ""
    r93.link = ""
    r93.save!

    r94 = Resource.new
    r94.name = "When experiencing conflict, identify the source of the conflict. It may not be what you expect. What motivations, attitudes and pressures may be contributing factors in creating conflict?"
    r94.resource_category = "Reflect On It"
    r94.description = ""
    r94.link = ""
    r94.save!

    r95 = Resource.new
    r95.name = "Reflect on a time when you faced conflict with another person. How did you respond to the conflict? What would you change about your response?"
    r95.resource_category = "Reflect On It"
    r95.description = ""
    r95.link = ""
    r95.save!

    r96 = Resource.new
    r96.name = "Think about a time when you sensed another person’s emotional state without being told. What non-verbal cues informed your intuition? How could you have tested your impression?"
    r96.resource_category = "Reflect On It"
    r96.description = ""
    r96.link = ""
    r96.save!

    r97 = Resource.new
    r97.name = "Think of a time when you made a surprising and unintended impression on someone. How might your non-verbal cues have led to this impression?"
    r97.resource_category = "Reflect On It"
    r97.description = ""
    r97.link = ""
    r97.save!

    r98 = Resource.new
    r98.name = "Consider how you determine which communication medium you use for a given message.  Why did you choose this medium?  Can you articulate this choice to others in a way that may help them develop their ability to discern the most appropriate medium?"
    r98.resource_category = "Reflect On It"
    r98.description = ""
    r98.link = ""
    r98.save!

    r99 = Resource.new
    r99.name = "How comfortable do you believe others are in addressing concerns with you?  What factors lead you to this conclusion?  Are there ways you can increase your openness to feedback from others?"
    r99.resource_category = "Reflect On It"
    r99.description = ""
    r99.link = ""
    r99.save!

    r100 = Resource.new
    r100.name = "In what ways can you help people in your department improve their communication effectiveness?"
    r100.resource_category = "Reflect On It"
    r100.description = ""
    r100.link = ""
    r100.save!

    # Step 4: add the indicator-resource relationships

    relationships = [[i2,r7],[i2,r10],[i2,r16],[i2,r17],[i2,r24],[i2,r25],[i2,r27],[i2,r2],[i2,r33],[i2,r35],[i2,r61],[i2,r73],[i2,r82],[i2,r86],[i2,r87],[i2,r88],[i2,r90],
                   [i3,r3],[i3,r6],[i3,r18],[i3,r25],[i3,r26],[i3,r28],[i3,r30],[i3,r31],[i3,r35],[i3,r59],[i3,r78],[i3,r80],[i3,r82],[i3,r85],[i3,r87],[i3,r89],[i4,r6],
                   [i4,r17],[i4,r28],[i4,r32],[i4,r35],[i4,r57],[i4,r60],[i4,r62],[i4,r76],[i4,r82],[i4,r88],[i5,r3],[i5,r10],[i5,r18],[i5,r24],[i5,r28],[i5,r29],[i5,r31],
                   [i5,r33],[i5,r35],[i5,r58],[i5,r61],[i5,r73],[i5,r86],[i5,r87],[i5,r90],[i6,r3],[i6,r16],[i6,r28],[i6,r30],[i6,r35],[i6,r57],[i6,r59],[i6,r76],[i6,r78],
                   [i6,r82],[i6,r85],[i7,r6],[i7,r7],[i7,r10],[i7,r17],[i7,r18],[i7,r24],[i7,r26],[i7,r27],[i7,r29],[i7,r31],[i7,r33],[i7,r35],[i7,r36],[i7,r57],[i7,r58],
                   [i7,r61],[i7,r73],[i7,r80],[i7,r85],[i7,r86],[i7,r87],[i7,r88],[i7,r90],[i8,r3],[i8,r6],[i8,r7],[i8,r10],[i8,r16],[i8,r18],[i8,r26],[i8,r31],[i8,r33],
                   [i8,r35],[i8,r36],[i8,r57],[i8,r58],[i8,r60],[i8,r73],[i8,r80],[i8,r86]]

    relationships.sort.each do |pair|
        ir = IndicatorResource.new
        ir.indicator = pair[0]
        ir.resource = pair[1]
        ir.save!
    end

    # Step 5: add questions

    q1 = Question.new
    q1.question = "When I have something to say, I prepare by organizing my thoughts and outlinging my intention."
    q1.save!

    q2 = Question.new
    q2.question = "I pay attention and focus when someone is talking to me."
    q2.save!

    q3 = Question.new
    q3.question = "I can recognize non-verbal cues from others."
    q3.save!

    q4 = Question.new
    q4.question = "When given direction by my supervisor, I understand what is being asked of me."
    q4.save!

    q5 = Question.new
    q5.question = "I am able to present information to others in a clear and concise manner."
    q5.save!

    q6 = Question.new
    q6.question = "When I don't understand something, I am able to resolve by asking clarifying questions."
    q6.save!

    q7 = Question.new
    q7.question = "After interacting with an individual, I am able to tailor my communication style to meet his/her needs."
    q7.save!

    q8 = Question.new
    q8.question = "My written communication is clear and concise."
    q8.save!

    q9 = Question.new
    q9.question = "My written communication is free of grammatical errors."
    q9.save!

    q10 = Question.new
    q10.question = "I am able to give direction that prompts the requested action."
    q10.save!

    q11 = Question.new
    q11.question = "I am able to gauge my audience and know which communication method to use."
    q11.save!

    q12 = Question.new
    q12.question = "I am able to paraphrase or restate a message I have received with accuracy."
    q12.save!

    q13 = Question.new
    q13.question = "I am able to adjust my message in response to the non-verbal cues I receive."
    q13.save!

    q14 = Question.new
    q14.question = "I encourage others to share their ideas and opinions."
    q14.save!

    q15 = Question.new
    q15.question = "I can translate complex concepts into easy-to-understand ideas and information."
    q15.save!

    q16 = Question.new
    q16.question = "I can inspire others by communicating a vision or plan."
    q16.save!

    # Step 6: add question - indicator relationship

    relationships = [
        [q1,i1],[q2,i2],[q3,i3],[q4,i5],[q5,i6],[q6,i10],[q7,i11],[q8,i12],[q9,i14],[q10,i15],
        [q11,i16],[q12,i19],[q13,i20],[q14,i22],[q15,i24]
    ]

    relationships.sort.each do |pair|
        iq = IndicatorQuestion.new
        iq.question = pair[0]
        iq.indicator = pair[1]
        iq.save!
    end

    # Step 7: create a superadmin
    user = User.new
    user.username = "CMUpdscomp"
    user.email = "test@mail.com"
    user.password = "PD5$ervices"
    user.password_confirmation = "PD5$ervices"
    user.save!

  end
end