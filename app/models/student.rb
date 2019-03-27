class Student < ApplicationRecord
  has_one :document

  AVAILABLE_STUDENTS = [
      'Peter Bariš',
      'Maroš Benka',
      'Slavomír Cimbalista',
      'Pavol Dravecký',
      'Jakub Dzurilla',
      'Peter Fedorek',
      'Martin Galovič',
      'Lukáš Garnek',
      'Roman Grék',
      'Matúš Hudák',
      'Sebastián Hutník',
      'Branislav Janči',
      'Martin Jaseňák',
      'Daniel Kormanský',
      'Ján Krempaský',
      'Adam Kuruc',
      'Juraj Marec',
      'Martin Maskaľ',
      'Lukáš Mišanko',
      'Ján Olšavský',
      'Daniel Pisarčík',
      'Richard Sankovský',
      'Dávid Schwartz',
      'Filip Slebodník',
      'Samuel Slebodník',
      'Dominik Šulian',
      'Dávid Tokarčík',
      'Martin Valluš',
      'Tomáš Zajac',
      'Maroš Zummer'
  ].freeze

  def self.pending_names
    except = Document.all.map {|d| d.student.name}
    AVAILABLE_STUDENTS - except
  end
end
