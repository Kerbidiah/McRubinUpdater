print `brew update --cleanup`
installed = `brew list`
progList = installed.split("\n")

delList = [""]
numItems = progList.size - 1
i = 0
while i <= numItems
	item = progList[i]
	sizeItem = item.size - 1
	i2 = 0
	while i2 <= sizeItem
		if item[i2] == "@"
			delList.insert(-1, item)
			i2 = sizeItem + 1
		else
			i2 += 1
		end
	end
	i += 1
end
progList -= delList
numItems = progList.size - 1
i = 0
while i <= numItems
	print `brew upgrade #{progList[i]} --cleanup`
	print `brew postinstall #{progList[i]}`
	i += 1
end
print `brew prune`
print `gem update`
