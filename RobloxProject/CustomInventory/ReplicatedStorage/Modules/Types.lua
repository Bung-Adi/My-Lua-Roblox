-- modules
local Types = {}

--Inventory System
export type StackData = {
	Name: string;
	Description: string;
	Image: string;
	ItemType: string;
	IsDroppabe: boolean;
	Items: {Tool};
	StackId: number;
}
export type Hotbar = {
	Slot1: number?;
	Slot2: number?;
	Slot3: number?;
	Slot4: number?;
	Slot5: number?;
	Slot6: number?;
	Slot7: number?;
	Slot8: number?;
	Slot10: number?;
}
export type Armor = {
	Head: number?;
	Cloth: number?;
	Feet: number?;
}
export type Inventory = {
	Inventory: {StackData};
	Hotbar: Hotbar;
	Armor: Armor;
	NextStackId: number;
}

return Types