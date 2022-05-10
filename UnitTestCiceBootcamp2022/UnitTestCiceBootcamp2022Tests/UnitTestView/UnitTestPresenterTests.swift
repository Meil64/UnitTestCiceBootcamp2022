//
//  UnitPresenterTests.swift
//  UnitTestCiceBootcamp2022Tests
//
//  Created by Carlos Carrera on 2/5/22.
//

import XCTest
@testable import UnitTestCiceBootcamp2022

class UnitTestPresenterTests: XCTestCase {

    //Subject Under Test
    //var sut: UnitTestPresenter!
    var presenter: UnitTestPresenter!
    
    override func setUp() {
        //Inicializa todas las instancias del objeto bajo prueba
        print(#function, "<-- ZZZ")
        presenter = UnitTestPresenter()
    }
    
    override func tearDown() {
        //Elimina las instancias por cada test que se ejecuta
        print(#function, "<-- YYY")
        presenter = nil
    }
    
    func test_UnitTestPresenter_NotNil(){
        print(#function, "<-- AAA")
        XCTAssertNotNil(presenter)
    }
    
    // Nombre del método / status bajo prueba / comportamiento esperado
    func test_Sumar_InputCorrecto_OKResult() {
        // 1 -> Arrange / GIVEN
        let resultExpected = 11
        let result: Int
        // 2 -> Action / WHEN
        result = presenter.sumar(numero1: 7, numero2: 4)
        // 3 -> Assert / THEN
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Restar_InputCorrecto_OKResult() {
        let resultExpected = 3
        let result = presenter.restar(numero1: 7, numero2: 4)
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Restar_InputCorrecto_Two_OK_Result(){
        let resultExpected = -10
        let result = presenter.restar(numero1: 10, numero2: 20)
        XCTAssertEqual(resultExpected, result)
    }
    
    func test_Dividir_InputCorrecto_OK_Result() {
        XCTAssertEqual(2, presenter.dividir(numero1: 4, numero2: 2))
    }
    
    func test_Dividir_InputIncorrecto_OK_Result() {
        XCTAssertEqual(2, try presenter.dividirCero(numero1: 4, numero2: 2))
        XCTAssertThrowsError(try presenter.dividirCero(numero1: 4, numero2: 0))
    }

    func test_ArraySquare_OptionOne_Result() {
        var numbers = [Int]()
        for index in 1...4{
            numbers.append(index)
        }
        let numbersSquare = presenter.arraySquareOptionOne(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        
        XCTAssertEqual(resultExpected, numbersSquare)
    }
    
    func test_ArraySquare_OptionTwo_Result() {
        var numbers = [Int]()
        for index in 1...4{
            numbers.append(index)
        }
        let numbersSquare = presenter.arraySquareOptionTwo(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        
        XCTAssertEqual(resultExpected, numbersSquare)
    }
    
    func test_ArraySquare_OptionThree_Result() {
        var numbers = [Int]()
        for index in 1...4{
            numbers.append(index)
        }
        let numbersSquare = presenter.arraySquareOptionThree(numberArray: numbers)
        
        var resultExpected = [Int]()
        resultExpected.append(1)
        resultExpected.append(4)
        resultExpected.append(9)
        resultExpected.append(16)
        
        XCTAssertEqual(resultExpected, numbersSquare)
    }
    
    func test_Assert_Types() {
        XCTAssertTrue(1 == 1)
        XCTAssertFalse(1 == 2)
        XCTAssertNil(nil)
        XCTAssertNotNil(self.presenter)
        XCTAssertEqual(self.presenter.sumar(numero1: 2, numero2: 2), 4)
        XCTAssertEqual("Andres", "andres".capitalized)
        XCTAssertGreaterThan(10, 1)
    }
    
    func test_Performance_Sut_Dividir() {
        self.measure {
            self.presenter.dividir(numero1: 4, numero2: 2)
        }
    }
    
    func test_Performance_array_Square_Option_One(){
        var number = [Int]()
        for index in 1...5000000{
            number.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionOne(numberArray: number)
        }
    }
    
    func test_Performance_array_Square_Option_Two(){
        var number = [Int]()
        for index in 1...5000000{
            number.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionTwo(numberArray: number)
        }
    }
    
    func test_Performance_array_Square_Option_Three(){
        var number = [Int]()
        for index in 1...5000000{
            number.append(index)
        }
        self.measure {
            self.presenter.arraySquareOptionThree(numberArray: number)
        }
    }
    
    func test_Performance_toFah_One_Result() {
        let expectedResult: Double = -9.4
        let result = self.presenter.toFah(degreeUnit: -23)
        XCTAssertEqual(expectedResult, result, accuracy: 0.001)
        self.measure {
            result
        }
    }
    
    func test_Performance_toFah_Two_Result() {
        let expectedResult: Double = -9.4
        let result = self.presenter.toFahTwo(degreeUnit: -23)
        XCTAssertEqual(expectedResult, result, accuracy: 0.001)
        self.measure {
            result
        }
    }
}
