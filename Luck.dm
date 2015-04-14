/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)


// Make objects move 8 pixels per tick when walking
atom
	density = 0
	opacity = 0

client
	New()
		..()
		var/mob/U = new /mob/Eye
		U.client = src
		U.x = 7
		U.y = 7
		U.z = 1


mob
	step_size = 32

	Eye
/*		name = "Eye"
		icon = 'C.dmi'
*/
obj
	step_size = 32

	chest
		name = "Chest"
		icon = 'C.dmi'

		var/W = null
		var/area/START/M = null

		Click()
			if(W)
				world << "You find!"

				M.icon = 'Start.dmi'

				M.Clear()
			else
				world << "bI"

	Set
		name = "Set"
		icon = 'Set.dmi'
		icon_state = "1"

		var/list/SL = null

		var/area/START/M = null

		var/obj/SetS/S = null


		Click()



//			M.icon = 'Blank.dmi'

			icon_state = ""

			world << "set"
			SL = new/list()

			for(var/i=0, i<6, i++)
				S = new /obj/SetS (locate((1+i)*2, 10, 1))
				SL.Add(S)
				S.M = src
				S.icon_state = "[i+1]"

		proc
			Clear()
				for(var/i=6, i>0, i--)
					S = SL[i]
					del S
				M.S = text2num(icon_state)
	//			M.icon = 'Start.dmi'

	SetS

		name = "Set"
		icon = 'Set.dmi'

		var/obj/Set/M = null

		Click()
			world << "Set [icon_state]"

			M.icon_state = icon_state

			M.Clear()




area
	START
		name = "Start"
		icon = 'Start.dmi'

		var/list/L = null
		var/cards = null
		var/obj/chest/C = null
		var/obj/Set/s = null
		var/S = 1

		New()
			s = new /obj/Set (locate(12, 12, 1))
			s.M = src

		Click()
			icon = 'Blank.dmi'

			Create_C()



		proc
			Create_C()
				if(S!=1) cards = S
				else
					cards = rand(2,6)
				world << "[cards]"
				L = new/list()


				for(var/i=0, i<cards, i++)
					C = new /obj/chest (locate((1+i)*2, 7, 1))
					world << "[i]"
					L.Add(C)
					C.M = src

				var/obj/chest/W = pick(L)
				W.W = 1

			Clear()
				for(var/i=cards, i>0, i--)
					C = L[i]
					del C


