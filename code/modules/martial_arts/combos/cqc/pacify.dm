/datum/martial_combo/cqc/pacify
	name = "Pacify"
	steps = list(MARTIAL_COMBO_STEP_DISARM, MARTIAL_COMBO_STEP_HARM)
	explaination_text = "Non-lethal move for both guaranteed disarmament and stamina damage."

/datum/martial_combo/cqc/pacify/perform_combo(mob/living/carbon/human/user, mob/living/target, datum/martial_art/MA)
	if(!target.stat)
		target.visible_message("<span class='warning'>[user] strikes [target]'s arm and chest, taking his weapon</span>", \
							"<span class='userdanger'>[user] strikes your arm and chest. Whatever you were holding is gone now!</span>")
		playsound(get_turf(target), 'sound/weapons/cqchit2.ogg', 50, 1, -1)
		var/obj/item/I = target.get_active_hand()
		if(I && target.drop_from_active_hand())
			user.put_in_hands(I, ignore_anim = FALSE)
		target.apply_damage(35, STAMINA)
		add_attack_logs(user, target, "Melee attacked with martial-art [src] : Pacify", ATKLOG_ALL)
		return MARTIAL_COMBO_DONE
	return MARTIAL_COMBO_FAIL
