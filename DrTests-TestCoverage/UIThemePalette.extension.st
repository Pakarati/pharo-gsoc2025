Extension { #name : 'UIThemePalette' }

{ #category : '*DrTests-TestCoverage' }
UIThemePalette >> coveredColor [

	^ paletteDictionary at: #coveredColor ifAbsentPut: [ colorConfigurator coveredColor ]
]

{ #category : '*DrTests-TestCoverage' }
UIThemePalette >> notCoveredColor [

	^ paletteDictionary at: #notCoveredColor ifAbsentPut: [ colorConfigurator notCoveredColor ]
]

{ #category : '*DrTests-TestCoverage' }
UIThemePalette >> partiallyCoveredColor [ 

	^ paletteDictionary at: #partiallyCoveredColor ifAbsentPut: [ colorConfigurator partiallyCoveredColor ]
]
