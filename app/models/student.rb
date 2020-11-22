class Student
    attr_accessor :first_name



    @@all = []
    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end 

    def self.all
        @@all
    end 

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)   
    end 

    def student_tests
        BoatingTest.all.select{|test| test.student == self}
    end 

    def all_instructors
        self.student_tests.map{|test| test.instructor.name}.uniq
    end 

    def self.find_student(first_name)
        self.all.select{|student| student.first_name == first_name}
    end 

    def grade_percentage
        num_all_tests = self.student_tests.count.to_f 
        num_passed_tests = self.student_tests.select{|test| test.test_status == "passed"}.count.to_f
        percentage = (num_passed_tests / num_all_tests) * 100.00
        percentage
    end 


    



end


