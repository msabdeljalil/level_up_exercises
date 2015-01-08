Feature: Visit Splash Page
	As a user
	When I visit the Splash Page
	I expect to be able to to log in or sign up

	Scenario: Visit Splash Page
		When I visit the Splash Page
		Then I should see links to login and signup
