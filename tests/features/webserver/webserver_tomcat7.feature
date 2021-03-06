
Feature: Openshift Tomcat 7 tests

  @jboss-webserver-3/webserver30-tomcat7-openshift
  Scenario: Check that the labels are correctly set
    Given image is built
    Then the image should contain label com.redhat.component with value jboss-webserver-3-webserver30-tomcat7-openshift-container
    And the image should contain label name with value jboss-webserver-3/webserver30-tomcat7-openshift
    And the image should contain label io.openshift.expose-services with value 8080:http
    And the image should contain label io.openshift.tags with value builder,java,tomcat7

  @jboss-webserver-3/webserver31-tomcat7-openshift
  Scenario: Check that the labels are correctly set
    Given image is built
    Then the image should contain label com.redhat.component with value jboss-webserver-3-webserver31-tomcat7-openshift-container
    And the image should contain label name with value jboss-webserver-3/webserver31-tomcat7-openshift
    And the image should contain label io.openshift.expose-services with value 8080:http
    And the image should contain label io.openshift.tags with value builder,java,tomcat7

  # https://issues.jboss.org/browse/CLOUD-180
  @jboss-webserver-3/webserver30-tomcat7-openshift
  Scenario: Check if image version and release is printed on boot
    When container is ready
    Then container log should contain Running jboss-webserver-3/webserver30-tomcat7-openshift image, version

  # https://issues.jboss.org/browse/CLOUD-180
  @jboss-webserver-3/webserver31-tomcat7-openshift
  Scenario: Check if image version and release is printed on boot
    When container is ready
    Then container log should contain Running jboss-webserver-3/webserver31-tomcat7-openshift image, version

  @ci
  @jboss-webserver-3/webserver30-tomcat7-openshift @jboss-webserver-3/webserver31-tomcat7-openshift
  Scenario: Check that the webserver image contains 6 layers
    Given image is built
     Then image should contain 6 layers

