Extension { #name : 'UITheme' }

{ #category : '*DrTests-TestCoverage' }
UITheme >> coveredColor [

	^ colorPalette coveredColor
]

{ #category : '*DrTests-TestCoverage' }
UITheme >> notCoveredColor [

	^ colorPalette notCoveredColor
]

{ #category : '*DrTests-TestCoverage' }
UITheme >> partiallyCoveredColor [

	^ colorPalette partiallyCoveredColor
]
