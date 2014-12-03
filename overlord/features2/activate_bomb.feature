Feature: Configure Bomb
    In order to blow up an enemy
    As a hyperational super-being
    I want to create a bomb

    Scenario: Creating a bomb on the homepage
        Given I have not created a bomb
        When I create a bomb
        Then I expect a bomb to have been created
