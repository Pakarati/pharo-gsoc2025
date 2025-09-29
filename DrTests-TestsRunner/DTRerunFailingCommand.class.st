"
I am the command allowing one to rerun all the failures and expected failures tests of a test-run.
"
Class {
	#name : 'DTRerunFailingCommand',
	#superclass : 'DTResultCommand',
	#category : 'DrTests-TestsRunner-Commands',
	#package : 'DrTests-TestsRunner',
	#tag : 'Commands'
}

{ #category : 'executing' }
DTRerunFailingCommand >> execute [
    "| failures |
    failures := self context drTests pluginResult failures.
    
    failures ifNotEmpty: [
        self context drTests runPluginFor: (DTReRunConfiguration new
            originalConfiguration: self context drTests testsConfiguration;
            previousResult: self context drTests pluginResult;
            configurationToRun: (DTTestsRunnerConfiguration items: failures);
            yourself)
    ]"
    | failures expectedFailures allFailures |
    failures := self context drTests pluginResult failures.
    expectedFailures := self context drTests pluginResult expectedFailures.
    allFailures := failures, expectedFailures.
    
    allFailures ifNotEmpty: [
        self context drTests runPluginFor: (DTReRunConfiguration new
            originalConfiguration: self context drTests testsConfiguration;
            previousResult: self context drTests pluginResult;
            configurationToRun: (DTTestsRunnerConfiguration items: allFailures);
            yourself)
    ]

]
