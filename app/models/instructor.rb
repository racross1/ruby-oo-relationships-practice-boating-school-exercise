class Instructor
    attr_accessor :name


    @@all = []
    def initialize(name)
        @name = name

        @@all << self
    end 

    def self.all
        @@all
    end 

    def instructor_tests
        BoatingTest.all.select{|test| test.instructor == self}
    end 


    def passed_students
        students_who_passed = self.instructor_tests.select{|test| test.test_status == "passed"}
        students_who_passed.map{|test| test.student.first_name}
    end 

    def change_grade(status, test_name, student_name)
        student_test = self.instructor_tests.find{|test| test.student.first_name == student_name && test.test_name == test_name}
        if student_test
            student_test.test_status = status
            student_test
        else
            student = Student.all.find{|student| student.first_name == student_name}
            BoatingTest.new(student, test_name, status, self)
        end  
    end 


    def pass_student(test_name, student_name)
        self.change_grade("passed", test_name, student_name)
    end 

    def fail_student(test_name, student_name)
        self.change_grade("failed", test_name, student_name)
    end 

    def all_students
        self.instructor_tests.map{|test| test.student.first_name}.uniq
        binding.pry
    end 
        




end
