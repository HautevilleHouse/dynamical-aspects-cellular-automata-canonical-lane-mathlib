import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsCellularAutomataCanonicalLaneLean.UniversalityClassification

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure LyapunovExponents (A : CellularAutomataAlgebra) where
  sensitivityToInitialConditions : Prop
  lyapunovExponentDefined : Prop
  chaoticsensitivity : Prop
  lyapunovStability : Prop

structure LyapunovExponentsEvidence {A : CellularAutomataAlgebra}
    (L : LyapunovExponents A) where
  sensitivityToInitialConditionsClosed : L.sensitivityToInitialConditions
  lyapunovExponentDefinedClosed : L.lyapunovExponentDefined
  chaoticsensitivityClosed : L.chaoticsensitivity
  lyapunovStabilityClosed : L.lyapunovStability

def LyapunovExponentsClosed {A : CellularAutomataAlgebra}
    (L : LyapunovExponents A) : Prop :=
  L.sensitivityToInitialConditions ∧ L.lyapunovExponentDefined ∧ L.chaoticsensitivity ∧ L.lyapunovStability

theorem lyapunov_exponents_closed_from_evidence
    {A : CellularAutomataAlgebra} (L : LyapunovExponents A)
    (Ev : LyapunovExponentsEvidence L) : LyapunovExponentsClosed L := by
  exact And.intro Ev.sensitivityToInitialConditionsClosed
    (And.intro Ev.lyapunovExponentDefinedClosed
      (And.intro Ev.chaoticsensitivityClosed Ev.lyapunovStabilityClosed))

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse
