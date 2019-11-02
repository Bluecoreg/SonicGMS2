/// @description  Release
var total = ds_list_size(small_animals);
if (total > 0) {
    var ox = -(sprite_width * 0.5) + separation + (separation * irandom(total_spaces - 1));
    with (instance_create(x + ox, y - 16, small_animals[| irandom(total - 1)])) {
        depth = other.depth + 1;
        time_to_move = 12;
    }
}

/*
var total = ds_list_size(small_animals);
if (total > 0) {
    with (instance_create(x - 21 + (7 * irandom(6)), y - 16, small_animals[| irandom(total - 1)])) {
        depth = 17;
        time_to_move = 12;
    }
}

/* */
/*  */
